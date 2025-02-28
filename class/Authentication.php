<?php

// generate json web token :: JWT
include_once('php-jwt-main/src/BeforeValidException.php');
include_once('php-jwt-main/src/ExpiredException.php');
include_once('php-jwt-main/src/SignatureInvalidException.php');
include_once('php-jwt-main/src/Key.php');
include_once('php-jwt-main/src/JWT.php');

use \Firebase\JWT\JWT;
use \Firebase\JWT\Key;

class Authentication extends dbobject
{
    protected $tokenKey = "";
    protected $tokenIssuedAt = "";
    protected $tokenExpirationTime = "";
    protected $tokenIssuer = "";
    protected $base_url = "";
    protected $tokenAlgorithm = "";

    protected $individualAccountRole = "";
    protected $companyAccountRole = "";
    protected $driverAccountRole = "";

    public function __construct()
    {
        parent::__construct();

        $this->base_url = $this->getitemlabel("parameter", "parameter_name", "EAGLE_DOMAIN_URL", "parameter_value");

        // $this->tokenKey = "h[wm+6c?5q7&g=z-p=9";
        $this->tokenKey = "h8BHWDXuW1IPcUHNcCNdsDKucaqHgLzN6ZZT4DMm0LM=";
        $this->tokenIssuedAt = time();
        // $this->tokenExpirationTime = $this->tokenIssuedAt + (24 * 60 * 60); //1day
        $this->tokenExpirationTime = $this->tokenIssuedAt + (15 * 60); //15 minutes
        // $this->tokenExpirationTime = $this->tokenIssuedAt + (15); //15 secs
        // $this->tokenExpirationTime = 15 * 60; //15 secs
        $this->tokenIssuer = $this->base_url;
        $this->tokenAlgorithm = "HS256";

        //default account role ids
        $this->individualAccountRole = '200';
    }

    private function validateIndividualUser($data)
    {
        $first_name = isset($data['first_name']) ? $data['first_name'] : '';
        $last_name = isset($data['last_name']) ? $data['last_name'] : '';
        $email = isset($data['email']) ? $data['email'] : '';
        $phone_number = isset($data['phone_number']) ? $data['phone_number'] : '';
        $password = isset($data['password']) ? $data['password'] : '';
        $gender = isset($data['gender']) ? strtoupper($data['gender']) : '';
        $date_of_birth = isset($data['date_of_birth']) ? strtoupper($data['date_of_birth']) : '';
        $nin = isset($data['nin']) ? strtoupper($data['nin']) : '';

        if ($first_name == "") {
            return array('status' => '119', 'message' => 'First Name is Required');
        }
        if ($last_name == "") {
            return array('status' => '125', 'message' => 'Last Name is Required');
        }
        if ($email == "") {
            return array('status' => '124', 'message' => 'Email Address is Required');
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return array('status' => '124', 'message' => 'Invalid Email Address');
        }
        if ($phone_number == "") {
            return array('status' => '123', 'message' => 'Phone Number is Required');
        }
        if (strlen($phone_number) != 11) {
            return array('status' => '123', 'message' => 'Phone Number must be an 11 digit Nigerian Phone Number');
        }
        if (!is_numeric($phone_number)) {
            return array('status' => '123', 'message' => 'Phone Number must be an 11 digit Number Nigerian Phone Number');
        }
        if ($password == "") {
            return array('status' => '122', 'message' => 'Password is Required');
        }
        if ($gender == "") {
            return array('status' => '127', 'message' => 'Gender is Required');
        }
        if ($nin == "") {
            return array('status' => '132', 'message' => 'National Identification Number is Required');
        }
        // if($date_of_birth == "" || $date_of_birth == '0000-00-00') {
        //     return array('status' =>'132', 'message' => 'Date of Birth is Required');
        // }
        // $dob_arr  = explode('-', $date_of_birth);
        // if(!checkdate($dob_arr[1], $dob_arr[2], $dob_arr[0])) {
        //     return array('status' =>'132', 'message' => 'Invalid Date  Format (Y-m-d)');
        // }
        if ($gender != "MALE" && $gender != "FEMALE") {
            return array('status' => '127', 'message' => 'Gender can only be either Male/Female');
        }

        $found = $this->getitemlabel("userdata", "username", $email, "username");
        if ($found) {
            return array('status' => '120', 'message' => 'Email Address is already in use');
        }

        $found = $this->getitemlabel("userdata", "mobile_phone", $phone_number, "username");
        if ($found) {
            return array('status' => '121', 'message' => 'Phone Number is already in use');
        }

        $role_name = $this->getitemlabel("role", "role_id", $this->individualAccountRole, 'role_name');
        if ($role_name == '') {
            return array('status' => '126', 'message' => 'Account Profiling Resource is not Available at the moment.');
        }


        return array('status' => '200', 'message' => 'Record is valid for Individual Account Creation');
    }


    public function beginIndividualUser($data)
    {
        $valid = $this->validateIndividualUser($data);
        if ($valid['status'] != '200') {
            return $valid;
        }


        //SEND OTP TO BOTH EMAIL AND PHONE NUMBER
        $email = isset($data['email']) ? $data['email'] : '';
        $phone_number = isset($data['phone_number']) ? $data['phone_number'] : '';
        $channel = isset($data['channel']) ? $data['channel'] : 'UNDISCLOSED';
        $purpose = " to verify account registration";
        $fullname = $data['first_name'] . ' ' . $data['last_name'];

        //LOG THE ACTIVITY
        $logged = $this->activity_log('2', $email,  $email, 'Account Signup verification process was initiated via mobile app');

        return $this->sendAuthOTP($email, $email, $purpose, $channel, $phone_number, $fullname);
    }

    public function sendAuthOTP($username, $email, $purpose, $channel, $phone, $fullname, $t_prefix = "REGPIN_")
    {
        $sms_charge = $this->getitemlabel("parameter", "parameter_name", "SMS_NOTIFICATION_CHARGE", "parameter_value");

        $xml_data = json_encode(array(
            'username' => $username,
            'email' => $email,
            'mobile_phone' => $phone,
            'purpose' => $purpose,
            'full_name' => $fullname,
            'prefix' => $t_prefix
        ));


        //do payment entry into transactions table data
        $transaction_query = "INSERT INTO transaction_table(transaction_id, source_acct, destination_acct, trans_type, transaction_desc, transaction_amount, payment_mode,initial_balance, current_balance, posted_ip, posted_user, settlement_status, created, response_code, channel, xml_data) VALUES (";

        $created = date('Y-m-d H:i:s');
        $operation_type = '2'; //debit
        $transaction_id = $t_prefix . $this->generateTransactionID();

        $transaction_query .= "'" . $transaction_id . "', ";
        $transaction_query .= "'" . 'sms_charges' . "', ";
        $transaction_query .= "'" . $username . "', ";
        $transaction_query .= "'OTP', ";
        $transaction_query .= "'" . $purpose . "', ";
        $transaction_query .= "'" . $sms_charge . "', ";
        $transaction_query .= "'DEBT', ";
        $transaction_query .= "'" . 0 . "', ";
        $transaction_query .= "'" . 0 . "', ";
        $transaction_query .= "'" . $_SERVER['REMOTE_ADDR'] . "', ";
        $transaction_query .= "'" . $username . "', ";
        $transaction_query .= "'" . 0 . "', ";
        $transaction_query .= "'" . $created . "', ";
        $transaction_query .= "'" . 0 . "', ";

        $transaction_query .= "'" . $channel . "', ";
        $transaction_query .= "'" . $xml_data . "', ";

        $transaction_query = rtrim($transaction_query, ", ") . ")";
        $exec_transaction = $this->myconn->query($transaction_query);
        if ($this->myconn->affected_rows <= 0) {
            return array('status' => 129, 'message' => 'Unable to Initiate OTP Generation Service');
        }

        $transaction_ok = true;
        $code = $this->generateOTPCode($transaction_id, $phone);
        $message =  $message = "Kindly use this code: " . $code . strtolower($purpose);
        $otp_length = strlen($code);

        //send sms
        $sentSMS = $this->sendSMS($phone, $message);
        if (!$sentSMS) {
            $sentSMS = $this->sendSMS($phone, $message);
        }

        //send email
        $sentEmail = 0;
        if ($email != "") {
            $sentEmail = $this->sendOtpEmail($email, $message, $fullname, $t_prefix);
        }

        return ($sentSMS == 1 || $sentEmail == 1) ? array('status' => '200', 'message' => 'OTP has  been sent to both the Phone Number: ' . $phone . ' and the Email Address: ' . $email . ". Kindly provide the OTP to continue", 'data' => array('auth_code' => $transaction_id, 'token_digits' => $otp_length)) : array('status' => '404', 'message' => 'OTP Delivery Service is not available at the Moment. Kindly Try again later');
    }

    public function doIndividualUser($data)
    {

        $valid = $this->validateIndividualUser($data);
        if ($valid['status'] != '200') {
            return $valid;
        }


        $first_name = isset($data['first_name']) ? $data['first_name'] : '';
        $last_name = isset($data['last_name']) ? $data['last_name'] : '';
        $email = isset($data['email']) ? $data['email'] : '';
        $phone_number = isset($data['phone_number']) ? $data['phone_number'] : '';
        $password = isset($data['password']) ? $data['password'] : '';
        $date_of_birth = isset($data['date_of_birth']) ? $data['date_of_birth'] : '';
        $nin = isset($data['nin']) ? $data['nin'] : '';
        $gender = isset($data['gender']) ? strtoupper($data['gender']) : '';
        $username = $email;

        //OTP VERIFICATION
        $auth_code = isset($data['auth_code']) ? $data['auth_code'] : '';
        $otp_token = isset($data['otp_token']) ? $data['otp_token'] : '';
        if ($auth_code != '' || $otp_token != '') {

            $verified = $this->verifyOTP($auth_code, $phone_number, $username, $otp_token);
            if ($verified == false) {
                return array(
                    'status' => '130',
                    'message' => "Invalid or expired One Time Password(OTP)"
                );
            }
        }


        $role_name = $this->getitemlabel("role", "role_id", $this->individualAccountRole, 'role_name');
        if ($role_name == '') {
            return array('status' => '126', 'message' => 'Account Profiling Resource is not Available at the moment.');
        }

        $resp = $this->doUser('new', $username, $password, $first_name, $last_name, $email, $phone_number, '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', $this->individualAccountRole, $role_name, $email, $_SERVER['REMOTE_ADDR'], $gender, '', '', $date_of_birth, $nin);
        switch ($resp) {
            case '1':
                //send Reg Email here
                $regArr = array(
                    'email' => $email,
                    'account_username' => $email,
                    'profile_type' => $role_name,
                    'account_password' => $password,
                    'full_name' => $first_name . ' ' . $last_name
                );
                $this->sendAccountRegEmail($email, $regArr);

                //LOG THE ACTIVITY
                $logged = $this->activity_log('15', $email,  $email, 'Account Signup from the mobile APP');

                $retval = array('status' => '200', 'message' => 'Account Profile Creation Successful');
                break;
            case '-9':
                $retval = array('status' => '128', 'message' => 'Username/Email already profiled. Kindly change it.');
                break;
            case '-8':
                $retval = array('status' => '128', 'message' => 'Account Profile had been previously set up with the Username/Email');
                break;
            default:
                $retval = array('status' => '404', 'message' => "Account Profile Creation was Unsuccessful. Kindly try again later");
                break;
        }

        return $retval;
    }

    public function secureIndividualUser($data)
    {
        $auth_pin = isset($data['auth_pin']) ? $data['auth_pin'] : '';
        $address = isset($data['address']) ? $data['address'] : '';
        $username = isset($data['auth_username']) ? $data['auth_username'] : '';

        if ($auth_pin == "") {
            return array('status' => '131', 'message' => 'Account Authentication PIN is Required');
        }

        $check = $this->getitemlabel("userdata", "username", $username, "trans_pin");
        if ($check != "") {
            return array('status' => '200', 'message' => 'Account Authentication PIN had been previously Configured');
        }


        $desencrypt = new DESEncryption();
        $key = strtolower($username);
        $cipher_new_password = $desencrypt->des($key, $auth_pin, 1, 0, null, null);
        $str_cipher_new_password = $desencrypt->stringToHex($cipher_new_password);


        $query = "UPDATE userdata SET ";
        $query .= " trans_pin ='" . $str_cipher_new_password . "', ";
        if ($address != "") {
            $query .= " address ='" . $address . "', ";
        }
        $query .= " completed_reg = '1' WHERE username = '$username' LIMIT 1";
        $this->myconn->query($query);
        $count = $this->myconn->affected_rows;

        if ($count >= 1) {
            return array('status' => '200', 'message' => 'Account Security Configuration Completed Successfully');
        } else {
            return array('status' => '404', 'message' => 'Operation Could not be completed. Kindly try again later');
        }
    }

    public function resetAccountPin($data)
    {

        $old = isset($data['account_old_pin']) ? $data['account_old_pin'] : '';
        $auth_pin = isset($data['account_new_pin']) ? $data['account_new_pin'] : '';
        $email = isset($data['account_email_address']) ? $data['account_email_address'] : '';

        $username = isset($data['auth_username']) ? $data['auth_username'] : '';

        if ($auth_pin == "") {
            return array('status' => '131', 'message' => 'Account New Authentication PIN is Required');
        }

        if ($old == $auth_pin) {
            return array('status' => '143', 'message' => 'Old PIN and New PIN cannot be the same');
        }

        if ($old != "") {
            $valid = $this->validateAccountPin($username, $old);
            if ($valid == false) {
                return array('status' => '143', 'message' => 'Invalid Account Authentication PIN');
            }

            return $this->changeAccountTransPIN($username, $auth_pin);
        }

        if ($old == "" && $email == "") {
            return array('status' => '143', 'message' => 'Old PIN/Email Address is Required');
        }




        $originator = $this->myconn->query("SELECT email, username, mobile_phone, firstname, lastname FROM userdata WHERE username ='$username' LIMIT 1 ");
        $numrows = $originator->num_rows;

        if ($numrows == 0) {
            return array(
                'status' => '404',
                'message' => "The Specified Username Does not Exist "
            );
        }

        $record = $originator->fetch_assoc();
        $username = $record['username'];

        if ($email != "" && strtolower($email) != strtolower($record['email'])) {
            return array(
                'status' => '405',
                'message' => "Invalid Account Email Provided"
            );
        }


        $email = $record['email'];
        $phone = $record['mobile_phone'];
        $daty = date('Y-m-d H:i:s');
        $fullname = $record['firstname'] . " " . $record['lastname'];
        if ($email == "") {
            return array(
                'status' => '405',
                'message' => "Account not Profiled with Email "
            );
        }


        //SEND OTP
        $purpose = " to reset your Transaction PIN ";
        $channel = isset($data['channel']) ? $data['channel'] : 'UNDISCLOSED';
        $t_prefix = "RPIN_";
        $retval = $this->sendAuthOTP($username, $email, $purpose, $channel, $phone, $fullname,  $t_prefix);
        return $retval;
    }

    public function changeAccountPIN($data)
    {
        $old = isset($data['account_old_pin']) ? $data['account_old_pin'] : '';
        $auth_pin = isset($data['account_new_pin']) ? $data['account_new_pin'] : '';
        $email = isset($data['account_email_address']) ? $data['account_email_address'] : '';

        $username = isset($data['auth_username']) ? $data['auth_username'] : '';

        if ($auth_pin == "") {
            return array('status' => '131', 'message' => 'Account Authentication PIN is Required');
        }

        $userDetails = $this->getItemLabelArr("userdata", array("username"), array($username), array("username", "email", "password", "firstname", "lastname", "role_name", "mobile_phone"));
        if (!is_array($userDetails) || sizeof($userDetails) == 0) {
            return array(
                'status' => '134',
                'message' => "The Specified Username does not exist"
            );
        }

        if ($email != "" && strtolower($email) != strtolower($userDetails['email'])) {
            return array(
                'status' => '405',
                'message' => "Invalid Account Email Provided"
            );
        }

        $email = $userDetails['email'];
        $fullname  = $userDetails['firstname'] . " " . $userDetails['lastname'];
        $role_name = ($userDetails['role_name'] != '') ? $userDetails['role_name'] : 'UNDISCLOSED';
        $phone_number = $userDetails['mobile_phone'];
        $daty = date('Y-m-d H:i:s');


        //OTP VERIFICATION
        $auth_code = isset($data['auth_code']) ? $data['auth_code'] : '';
        $otp_token = isset($data['otp_token']) ? $data['otp_token'] : '';
        if ($auth_code != '' || $otp_token != '') {

            $verified = $this->verifyOTP($auth_code, $phone_number, $username, $otp_token);
            if ($verified == false) {
                return array(
                    'status' => '130',
                    'message' => "Invalid or expired One Time Password(OTP)"
                );
            }
        }

        if ($auth_pin == $old) {
            return array('status' => '131', 'message' => 'Account Authentication PIN cannot be SAME as Old PIN');
        }

        return $this->changeAccountTransPIN($username, $auth_pin);
    }


    private function changeAccountTransPIN($username, $auth_pin)
    {

        $old = isset($data['account_old_pin']) ? $data['account_old_pin'] : '';

        $transaction_ok = true;
        $this->myconn->autocommit(FALSE);
        $daty = date('Y-m-d H:i:s');
        $before = $this->getitemlabelArr("userdata", array("username"), array($username), "*");

        $desencrypt = new DESEncryption();
        $key = strtolower($username);
        $cipher_new_password = $desencrypt->des($key, $auth_pin, 1, 0, null, null);
        $str_cipher_new_password = $desencrypt->stringToHex($cipher_new_password);


        $query = "UPDATE userdata SET ";
        $query .= " trans_pin ='" . $str_cipher_new_password . "', ";
        $query .= " modified = '$daty' WHERE username = '$username' LIMIT 1";
        $this->myconn->query($query);
        if ($this->myconn->error != "" && $this->myconn->affected_rows <= 1) {
            $transaction_ok = false;
        }

        $after = $this->getitemlabelArr("userdata", array("username"), array($username), "*");
        $logged = $this->log_audit_trail("userdata",  $before, $after, 'username', $username, $_SERVER['REMOTE_ADDR'], 'PIN');
        if ($logged == false) {
            $transaction_ok = false;
        }

        //log the activity
        $change = ($old == "") ? " was reset with Email" : " was Changed from old PIN";
        $logged = $this->activity_log('33', $username, $username, "Account Authentication PIN $change ");
        if ($logged == false) {
            $transaction_ok = false;
        }


        if ($transaction_ok == true) {
            $this->myconn->commit();
            return array('status' => '200', 'message' => 'Account Security Configuration Completed Successfully');
        } else {
            $this->myconn->rollback();
            return array('status' => '404', 'message' => 'Operation Could not be completed. Kindly try again later');
        }
    }

    public function validateSessionToken()
    {

        $authorization = isset($_SERVER["HTTP_AUTHORIZATION"]) ? $_SERVER["HTTP_AUTHORIZATION"] : '';
        $token = trim(str_replace("Bearer ", "", $authorization));
        if ($token == "") {
            return array('status' => '444', 'message' => 'Missing Required Authorization in Request Header');
        }
        // if decode succeed, show user details
        return $this->extractDataFromToken($token);
    }
    public function extractDataFromToken($token)
    {
        try {
            // decode jwt
            $key = new Key($this->tokenKey, $this->tokenAlgorithm);
            $decoded = JWT::decode($token, $key);

            if ($decoded->iss != $this->tokenIssuer) {
                return array('status' => '116', 'message' => "Authorization Provided does not match this Environment. Kindly Login Again!");
            } else {

                // show user details
                $details = json_decode(json_encode($decoded->data), true);
                return array(
                    "status" => "200",
                    "message" => "Access granted.",
                    "data" => $details
                );
            }
        } catch (Exception $e) {
            $message = $e->getMessage();
            if (strtolower(substr($message, '0',  '9')) == "malformed") {
                return array('status' => '117', 'message' => 'Invalid/Malformed Authorization Bearer Token Provided');
            } elseif (strtolower(substr($message, '0',  '7')) == "expired") {
                return array('status' => 'Z200', 'message' => 'Access Token has Expired!');
            } else {
                return array('status' => '115', 'message' => 'Invalid/Expired System Authorization');
            }
        }
    }
    private function generateRefreshToken($token_data)
    {
        $token = array(
            "iat" => $this->tokenIssuedAt,
            // "exp" => $this->tokenIssuedAt + (2 * 24 * 60 * 60), //1day
            "exp" => $this->tokenIssuedAt + (2 *  60), //1day
            // "exp" => 30 * 60, //30 seconds 
            // "exp" => $this->tokenIssuedAt + (1 * 60), //1 minute
            "iss" => $this->tokenIssuer,
            "data" => $token_data
        );



        // generate jwt
        $jwt = JWT::encode($token, $this->tokenKey, $this->tokenAlgorithm);

        return $jwt;
    }

    public function fetchUserData($username, $device_serial_no = '')
    {

        $get_details = "SELECT * FROM userdata where username = '$username'";
        $user_result = $this->db_query($get_details);
        //   getting the allocated street to the road marshal
        $road_operator_str = "SELECT * FROM license_operator_streets where road_marshal_id = '$username'";
        $operator_result = $this->db_query($road_operator_str);
        $street_code = $operator_result[0]['street_name'];
        $first_name = $user_result[0]['firstname'];
        $last_name = $user_result[0]['lastname'];
        $agent_details = $user_result[0]['firstname'] .','. $user_result[0]['lastname'].' '.$username;
        // $lastname = $user_result[0]['lastname'];
     
        $area_id = $user_result[0]['area_id'];
        $email = $user_result[0]['email'];
        $strt_name = $this->getitemlabel('streets', 'street_code', $street_code, 'street_name');
        $area_name = $this->getitemlabel('areas', 'area_id', $area_id, 'areaName');
        $street_details = $strt_name .','. $area_name;
        $license_operator_id = $user_result[0]['license_operator_id'];
        $wallet = "SELECT road_marshal_balance FROM wallet_balance WHERE road_marshal_id = '$username'";
        $wallet_balance = $this->db_query($wallet);
        $wallet_result = $wallet_balance[0]['road_marshal_balance'];

        //getting the channel information
        $getting_device_id = "SELECT device_type FROM devices where device_serial_no = '$device_serial_no'";
        $device_result = $this->db_query($getting_device_id);
        $device_type = $device_result[0]['device_type'];

        $data = array(
            "Agent" => $agent_details,
            "road_marshal_balance" => (int)$wallet_result,
            "AreaCode" => $area_id,
            "Firstname" => $first_name,
            "Username" => $username,
            "Lastname" => $last_name,
            "Street" => $street_details,
            "email" => $email,
            "username" => $username,
            "license_operator_id" => $license_operator_id,
            "area" => $area_name,
            "street_name" => $strt_name,
            "channel" => $device_type
        );

        return $data;
    }
    private function generateAccessToken($data)
    {

        $token = array(
            "iat" => $this->tokenIssuedAt,
            "exp" => $this->tokenExpirationTime,
            "iss" => $this->tokenIssuer,
            "data" => $data
        );

        $jwt = JWT::encode($token, $this->tokenKey, $this->tokenAlgorithm);
        return $jwt;
    }

    public function regenerateAccessToken($token)
    {

        $refresh_token = $token;
        $sql1 = "SELECT user_flag,refresh_token,username FROM refresh_token where refresh_token = '$refresh_token' AND user_flag = '1' LIMIT 1";
        $sql_result = $this->db_query($sql1);
        $user_flag =  $sql_result[0]['user_flag'];
        $refresh_token = $sql_result[0]['refresh_token'];
        $username = $sql_result[0]['username'];
        if (count($sql_result) > 0) {
            //generate jwt token
            $tokenData = $this->fetchUserData($username);
            $access_token = $this->generateAccessToken($tokenData);
            //generate jwt token
            // $refresh_token = $this->generateRefreshToken($tokenData);
            return array('status' => '200', 'message' => 'successful', 'data' => array('access_token' => $access_token, 'access_expiry' => $this->tokenExpirationTime));
        } else {
            return array('status' => '291', 'message' => "The user has already logged out or didn't login");
        }
    }

    private function doPostLoginActions()
    {

        //send login email
        //generate jwt token
        $access_token = $this->generateAccessToken();
        //generate jwt token
        $refresh_token = $this->generateRefreshToken();
        return array('status' => '200', 'message' => 'successful', 'data' => array('access_token' => $access_token, 'access_expiry' => $this->tokenExpirationTime, 'refresh_token' => $refresh_token));
    }

    public function saveRefreshToken($username, $refresh_token, $device_serial_no)
    {

        $data['refresh_token'] = $refresh_token;
        $data['username'] =  $username;
        $data['user_flag'] = "1";
        $data['date_created'] = date('Y-m-d h:i:s');
        $data['device_serial_no'] = $device_serial_no;
        $login_out = "UPDATE refresh_token set user_flag = '0' WHERE username = '$username'";
        $flag_result = $this->db_query($login_out, false);
        // var_dump($data);exit;
        $count = $this->doInsert('refresh_token', $data, array('op', 'operation', 'id', 'nrfa-csrf-token-label'));
    }




    private function domarshalPostLoginActions($username, $device_serial_no)
    {
        //send login email
        // $data['username'] =  $_SESSION['username_sess'];
        // $username = $data['username'];
        // $sql = "SELECT * FROM refresh_token WHERE username = '$username'";
        // $result = $this->db_query($sql);
        // var_dump($result);exit;

        // $logout_2 = "UPDATE refresh_token set user_flag = '1' WHERE username = '$username' AND login_time = NOW()";
        // $flag_result2 = $this->db_query($logout_2);
        //generate jwt token

        $tokenData = $this->fetchUserData($username, $device_serial_no);
        $access_token = $this->generateAccessToken($tokenData);
        //generate jwt token
        $refresh_token = $this->generateRefreshToken($tokenData);
        $saveRefreshToken = $this->saveRefreshToken($username, $refresh_token, $device_serial_no);
        // save refresh token and username of the marshal
        return array('status' => '200', 'message' => 'successful', 'data' => array('access_token' => $access_token, 'access_expiry' => $this->tokenExpirationTime, 'refresh_token' => $refresh_token));
    }

    public function marshalLogout()
    {
        $data['username'] =  $_SESSION['username_sess'];
        $username = $data['username'];
        // update user from user flag table
        $date_signed_out = date('Y-m-d h:i:s');
        $sql = "UPDATE  refresh_token SET  user_flag = '0', signed_out_date = '$date_signed_out'   WHERE username = '$username'";
        $stmt = $this->db_query($sql);
        return array('status' => '001', 'message' => 'You have Succesfully Logout');
        session_destroy();
        exit;
    }

    public function signIn($username, $password, $isAdmin = true)
    {
        //LOG THE ACTIVITY
        // $logged = $this->activity_log('8', $username,  $username, 'Account Login Attempt Initiated');
        $label = $this->getcheckdetails($username, $password);
        switch ($label) {
            case '1':
                $retval = $this->doPostLoginActions();
                break;
            case '2':
                $retval = array('status' => '102', 'message' => 'Account Profile is currently disabled.');
                break;
            case '3':
                $retval = array('status' => '103', 'message' => 'Account Profile is currently locked.');
                break;
            case '4':
                $retval = array('status' => '104', 'message' => 'You are not allowed to login on Sunday.');
                break;
            case '5':
                $retval = array('status' => '105', 'message' => 'You are not allowed to login on Monday.');
                break;
            case '6':
                $retval = array('status' => '106', 'message' => 'You are not allowed to login on Tuesday.');
                break;
            case '7':
                $retval = array('status' => '107', 'message' => 'You are not allowed to login on Wednesday.');
                break;
            case '8':
                $retval = array('status' => '108', 'message' => 'You are not allowed to login on Thursday.');
                break;
            case '9':
                $retval = array('status' => '109', 'message' => 'You are not allowed to login on Friday.');
                break;
            case '10':
                $retval = array('status' => '110', 'message' => 'You are not allowed to login on Saturday.');
                break;
            case '11':
                $retval = array('status' => '111', 'message' => 'You are not allowed to login due to working hours violation.');
                break;
            case '12':
                $retval = array('status' => '112', 'message' => 'Too many wrong attempt. Your account has been locked.');
                break;
            case '0':
            case '13':
                $retval = array('status' => '113', 'message' => 'Invalid Username/Password.');
                break;
            case '14':
                $retval = array('status' => '114', 'message' => 'Change Password on Logon.');
                break;
            case '15':
                $retval = array('status' => '115', 'message' => 'Your Account Profile does not have Access to this Portal');
                break;
            default:
                $retval = array('status' => '404', 'message' => 'Unable to proceed at the moment. Kindly try again later');
                break;
        }


        return $retval;
    }
    public function marshalsignIn($username, $password, $device_serial_no, $isAdmin = true)
    {
        //LOG THE ACTIVITY
        // $logged = $this->activity_log('8', $username,  $username, 'Account Login Attempt Initiated');

        $label = $this->marshalcheckDetails($username, $password, $device_serial_no);

        switch ($label) {
            case '1':
                $retval = $this->domarshalPostLoginActions($username, $device_serial_no);
                break;
            case '2':
                $retval = array('status' => '102', 'message' => 'Account Profile is currently disabled.');
                break;
            case '3':
                $retval = array('status' => '103', 'message' => 'Account Profile is currently locked.');
                break;
            case '4':
                $retval = array('status' => '104', 'message' => 'You are not allowed to login on Sunday.');
                break;
            case '5':
                $retval = array('status' => '105', 'message' => 'You are not allowed to login on Monday.');
                break;
            case '6':
                $retval = array('status' => '106', 'message' => 'You are not allowed to login on Tuesday.');
                break;
            case '7':
                $retval = array('status' => '107', 'message' => 'You are not allowed to login on Wednesday.');
                break;
            case '8':
                $retval = array('status' => '108', 'message' => 'You are not allowed to login on Thursday.');
                break;
            case '9':
                $retval = array('status' => '109', 'message' => 'You are not allowed to login on Friday.');
                break;
            case '10':
                $retval = array('status' => '110', 'message' => 'You are not allowed to login on Saturday.');
                break;
            case '11':
                $retval = array('status' => '111', 'message' => 'You are not allowed to login due to working hours violation.');
                break;
            case '12':
                $retval = array('status' => '112', 'message' => 'Too many wrong attempt. Your account has been locked.');
                break;
            case '0':
            case '13':
                $retval = array('status' => '113', 'message' => 'Invalid Username/Password.');
                break;
            case '14':
                $retval = array('status' => '114', 'message' => 'Change Password on Logon.');
                break;
            case '15':
                $retval = array('status' => '115', 'message' => 'Your Account Profile does not have Access to this Portal');
                break;
            case '16':
                $retval = array('status' => '203', 'message' => 'Your Device ID is not valid');
                break;
            case '17':
                $retval = array('status' => '204', 'message' => 'Device Not Found Under License Operator');
                break;
            default:
                $retval = array('status' => '404', 'message' => 'Unable to proceed at the moment. Kindly try again later');
                break;
        }


        return $retval;
    }

    //flag user account as locked
    public function toggleLockUserAccount($whereValue, $updateValue, $officer, $membership_code = "", $isSuper = true)
    {

        $afftd = "";
        $intVals = "";
        $trail_appl = $whereValue;
        $updatedVals = $updateValue;
        $tbl = "userdata";
        $updateField = "user_locked";
        $whereField = "username";
        $operation = "lock";


        $update_query = "UPDATE  $tbl SET $updateField = '$updateValue', pin_missed = '0' WHERE $whereField = '$whereValue' ";

        $query = "SELECT $updateField FROM $tbl WHERE $whereField = '$whereValue'  ";
        $result = $this->myconn->query($query);
        foreach ($result->fetch_array() as $key => $value) {
            $afftd .= $key . "/";
            $intVals .= $value . '/';
        }

        $daty = @date('Y-m-d H:i:s');
        $ip = $this->get_posted_ip();

        $log_query = "insert into audit_trail values('','$tbl','$trail_appl','$afftd','$intVals','$updateValue','$operation','$daty','$officer','$ip')";
        $transaction_ok = true;
        $this->myconn->autocommit(FALSE);



        $this->myconn->query($update_query);

        //global log
        $log_result = $this->myconn->query($log_query);
        if (@$this->myconn->affected_rows != 1) {
            $this->debug_logger(array('toggleLockUserAccount LOG_QUERY' => $this->myconn->affected_rows));
            $transaction_ok = false;
        }

        if ($transaction_ok == true) {
            // echo "commit <br>";
            $this->myconn->commit();
            return true;
        } else {
            // echo "rollback<br>"; 
            $this->myconn->rollback();
            return false;
        }
    }

    //flag user account as disabled
    public function toggleDisableUserAccount($whereValue, $updateValue, $officer, $membership_code = "")
    {

        $afftd = "";
        $intVals = "";
        $trail_appl = $whereValue;
        $updatedVals = $updateValue;
        $tbl = "userdata";
        $updateField = "user_disabled";
        $whereField = "username";
        $operation = "dis";


        $update_query = "UPDATE  $tbl SET $updateField = '$updateValue' WHERE $whereField = '$whereValue'";
        // echo $update_query;

        $query = "SELECT $updateField FROM $tbl WHERE $whereField = '$whereValue' ";
        $result = $this->myconn->query($query);
        foreach ($result->fetch_array() as $key => $value) {
            $afftd .= $key . "/";
            $intVals .= $value . '/';
        }

        $daty = @date('Y-m-d H:i:s');
        $ip = $this->get_posted_ip();

        $log_query = "insert into audit_trail values('','$tbl','$trail_appl','$afftd','$intVals','$updateValue','$operation','$daty','$officer','$ip')";


        $transaction_ok = true;
        $this->myconn->autocommit(FALSE);

        $update_result = $this->myconn->query($update_query);
        if (@$this->myconn->affected_rows != 1) {
            $this->debug_logger(array('toggleDisableUserAccount update_QUERY' => $this->myconn->affected_rows));
            $transaction_ok = false;
        }


        //local log
        $log_result = $this->myconn->query($log_query);
        if (@$this->myconn->affected_rows != 1) {
            $this->debug_logger(array('toggleDisableUserAccount log_QUERY' => $this->myconn->affected_rows));
            $transaction_ok = false;
        }


        if ($transaction_ok == true) {
            // echo "commit <br>";
            $this->myconn->commit();

            return true;
        } else {
            // echo "rollback<br>";
            $this->myconn->rollback();

            return false;
        }
    }

    //enable or disable trans_allow
    public function toggleTransactionOnUserAccount($whereValue, $updateValue, $officer, $membership_code = "", $isSuper = true)
    {

        $afftd = "";
        $intVals = "";
        $trail_appl = $whereValue;
        $updatedVals = $updateValue;
        $tbl = "userdata";
        $updateField = "trans_allow";
        $whereField = "username";
        $operation = "tnx";

        $update_query = "UPDATE  $tbl SET $updateField = '$updateValue' WHERE $whereField = '$whereValue' ";
        // echo $update_query;

        $query = "SELECT $updateField FROM $tbl WHERE $whereField = '$whereValue'  ";
        $result = $this->myconn->query($query);
        foreach ($result->fetch_array() as $key => $value) {
            $afftd .= $key . "/";
            $intVals .= $value . '/';
        }

        $daty = @date('Y-m-d H:i:s');
        $ip = $this->get_posted_ip();

        $log_query = "insert into audit_trail values('','$tbl','$trail_appl','$afftd','$intVals','$updateValue','$operation','$daty','$officer','$ip')";


        $transaction_ok = true;
        $this->myconn->autocommit(FALSE);



        $update_result = $this->myconn->query($update_query);
        if (@$this->myconn->affected_rows != 1) {
            $transaction_ok = false;
        }

        //global log
        $log_result = $this->myconn->query($log_query);
        if (@$this->myconn->affected_rows != 1) {
            $transaction_ok = false;
        }

        //local log
        $log_result = $this->myconn->query($log_query);
        if (@$this->myconn->affected_rows != 1) {
            $transaction_ok = false;
        }



        if ($transaction_ok == true) {
            // echo "commit <br>";
            $this->myconn->commit();
            return true;
        } else {
            // echo "rollback<br>";
            $this->myconn->rollback();
            return false;
        }
    }


    public function forgotUserAccountPassword($data)
    {

        $account_username = isset($data['username']) ? $data['username'] : '';

        $originator = $this->myconn->query("SELECT email, username, mobile_phone, firstname, lastname FROM userdata WHERE username ='$account_username' LIMIT 1 ");
        $numrows = $originator->num_rows;

        if ($numrows == 0) {
            return array(
                'status' => '404',
                'message' => "The Specified Username Does not Exist "
            );
        }

        $record = $originator->fetch_assoc();
        $username = $record['username'];
        $email = $record['email'];
        $phone = $record['mobile_phone'];
        $daty = date('Y-m-d H:i:s');
        $fullname = $record['firstname'] . " " . $record['lastname'];
        if ($email == "") {
            return array(
                'status' => '405',
                'message' => "Account not Profiled with Email "
            );
        }

        //SEND OTP
        $purpose = " to reset forgotten account password ";
        $channel = isset($data['channel']) ? $data['channel'] : 'UNDISCLOSED';
        $t_prefix = "RPASS_";
        $retval = $this->sendAuthOTP($username, $email, $purpose, $channel, $phone, $fullname,  $t_prefix);
        return $retval;
    }

    public function resetUserAccountPassword($data)
    {
        $new_password = isset($data['new_password']) ? $data['new_password'] : '';
        $username = isset($data['username']) ? $data['username'] : '';

        $data = array(
            'username' => $username,
            'new_password' => $new_password
        );
        $validate = $this->validate(
            $data,
            array('username' => 'required', 'new_password' => 'required|min:8'),
            array('username' => 'Username', 'new_password' => 'Password')
        );

        $regex = $this->validateUserPassword($data['new_password']);

        if ($validate['error']) {
            return array(
                'status' => '420',
                'message' =>  $validate['messages'][0]
            );
        }

        if ($regex != 1) {
            return array(
                'status' => '425',
                'message' =>  $regex
            );
        }

        if ($new_password == '') {
            return array(
                'status' => '133',
                'message' => "Password is Required"
            );
        }

        if ($username == '') {
            return array(
                'status' => '134',
                'message' => "The Username is Required"
            );
        }

        $userDetails = $this->getItemLabelArr("userdata", array("username"), array($username), array("username", "email", "password", "firstname", "lastname", "role_name", "mobile_phone"));
        if (!is_array($userDetails) || sizeof($userDetails) == 0) {
            return array(
                'status' => '134',
                'message' => "The Specified Username does not exist"
            );
        }

        $email = $userDetails['email'];
        $fullname  = $userDetails['firstname'] . " " . $userDetails['lastname'];
        $role_name = ($userDetails['role_name'] != '') ? $userDetails['role_name'] : 'UNDISCLOSED';
        $phone_number = $userDetails['mobile_phone'];
        $daty = date('Y-m-d H:i:s');

        //OTP VERIFICATION
        $auth_code = isset($data['auth_code']) ? $data['auth_code'] : '';
        $otp_token = isset($data['otp_token']) ? $data['otp_token'] : '';
        if ($auth_code != '' || $otp_token != '') {

            $verified = $this->verifyOTP($auth_code, $phone_number, $username, $otp_token);
            if ($verified == false) {
                return array(
                    'status' => '130',
                    'message' => "Invalid or expired One Time Password(OTP)"
                );
            }
        }


        $desencrypt = new DESEncryption();
        $key = strtolower($username);
        $cipher_new_password = $desencrypt->des($key, $new_password, 1, 0, null, null);
        $str_cipher_new_password = $desencrypt->stringToHex($cipher_new_password);

        $str_cipher_old_password = $userDetails['password'];
        $status = true;
        $sent = 0;
        $posted_ip = $_SERVER['REMOTE_ADDR'];
        $this->myconn->autocommit(false);

        //update password
        $changing = $this->myconn->query(" UPDATE userdata SET password = '$str_cipher_new_password', modified = '$daty'  WHERE username = '$username' LIMIT 1");
        if ($this->myconn->affected_rows != 1) {
            $status = false;
        }


        //log audit
        $log_query =  $this->myconn->query(" INSERT INTO audit_trail  VALUES ('','userdata','$username','password','$str_cipher_old_password','$str_cipher_new_password','chng','$daty','$username','$posted_ip')");
        if ($this->myconn->affected_rows != 1) {
            $status = false;
        }

        if ($status == true) {
            $this->myconn->commit();

            //send Password Email here
            $passArr = array(
                'email' => $email,
                'account_username' => $username,
                'profile_type' => $role_name,
                'account_password' => $new_password,
                'full_name' => $fullname
            );
            $sent = $this->sendAccountPasswordEmail($email, $passArr);

            if ($sent  == 1) {
                return array(
                    'status' => '200',
                    'message' => "Password Changed Successfully and Credentials have been sent to your email  - $email "
                );
            } else {
                return array(
                    'status' => '200',
                    'message' => "Account Password Changed Successfully!"
                );
            }
        } else {
            $this->myconn->rollback();
            return array(
                'status' => '501',
                'message' => "Unable to change account password "
            );
        }
    }

    public function confirmOTPValidity($data)
    {

        $username = isset($data['username']) ? $data['username'] : '';
        if ($username == '') {
            return array(
                'status' => '134',
                'message' => "The Username is Required"
            );
        }

        $userDetails = $this->getItemLabelArr("userdata", array("username"), array($username), array("username", "email", "password", "firstname", "lastname", "role_name", "mobile_phone"));
        if (!is_array($userDetails) || sizeof($userDetails) == 0) {
            return array(
                'status' => '134',
                'message' => "The Specified Username does not exist"
            );
        }

        $email = $userDetails['email'];
        $fullname  = $userDetails['firstname'] . " " . $userDetails['lastname'];
        $role_name = ($userDetails['role_name'] != '') ? $userDetails['role_name'] : 'UNDISCLOSED';
        $phone_number = $userDetails['mobile_phone'];
        $daty = date('Y-m-d H:i:s');

        //OTP VERIFICATION
        $auth_code = isset($data['auth_code']) ? $data['auth_code'] : '';
        $otp_token = isset($data['otp_token']) ? $data['otp_token'] : '';
        if ($auth_code != '' || $otp_token != '') {

            $verified = $this->verifyOTP($auth_code, $phone_number, $username, $otp_token);
            if ($verified == true) {
                return array(
                    'status' => '200',
                    'message' => "Valid One Time Password(OTP)"
                );
            }
        }

        return array(
            'status' => '130',
            'message' => "Invalid or expired One Time Password(OTP)"
        );
    }

    public function recreateOTPActivity($data)
    {

        //OTP auth
        $auth_code = isset($data['auth_code']) ? $data['auth_code'] : '';
        if ($auth_code == '') {
            return array(
                'status' => '444',
                'message' => "The OTP Authentication Code is required"
            );
        }

        //get the USER
        $request = $this->getItemLabelArr("transaction_table", array("transaction_id"), array($auth_code), array("source_acct", "posted_user", "created", "xml_data", "trans_type", "destination_acct"));

        if (!is_array($request) || sizeof($request) <= 0) {
            return array(
                'status' => '404',
                'message' => "Invalid OTP Activity Auth Code Reference"
            );
        }

        $daty = date('Y-m-d H:i:s');
        $record = json_decode($request['xml_data'], true);
        $username = $record['username'];
        $email = $record['email'];
        $phone = $record['mobile_phone'];
        $fullname = $record['full_name'];
        $purpose = $record['purpose'];
        $t_prefix = $record['prefix'];

        if ($email == "" || $phone == "") {
            return array(
                'status' => '405',
                'message' => "Unable to recover/retrieve the previous request details"
            );
        }

        //GET THE COUNT OF RECENT OTPS
        $current_timestamp = date('Y-m-d H:i:s');
        $checkQuery = "SELECT count(transaction_id) as total FROM transaction_table WHERE source_acct = '" . $request['source_acct'] . "' AND trans_type ='" . $request['trans_type'] . "' AND posted_user = '" . $request['posted_user'] . "' AND destination_acct ='" . $request['destination_acct'] . "' AND created >= Date_sub('$current_timestamp', interval 1 hour) ";
        $checkResult = $this->myconn->query($checkQuery);

        if ($this->myconn->error != "") {
            return array(
                'status' => '445',
                'message' => "Ooops! This service/operation is temporarily unreachable"
            );
        }

        if ($checkResult->num_rows > 0) {
            $row = $checkResult->fetch_assoc();
            $previouslySent = $row['total'];


            $limit = $this->getitemlabel("parameter", "parameter_name", "OTP_RESEND_LIMIT", "parameter_value");
            if ($limit  > 0 && $previouslySent >= $limit) {
                return array(
                    'status' => '137',
                    'message' => "Too many request for OTP. Kindly try again later"
                );
            }
        }

        //SEND OTP
        $channel = isset($data['channel']) ? $data['channel'] : 'UNDISCLOSED';
        $retval = $this->sendAuthOTP($username, $email, $purpose, $channel, $phone, $fullname,  $t_prefix, true);
        return $retval;
    }

    public function updateAccountAddress($data)
    {
        $username = isset($data['auth_username']) ? $data['auth_username'] : '';
        $address = isset($data['address']) ? $data['address'] : '';
        if ($address == '') {
            return array('status' => '135', 'message' => 'Address cannot be empty');
        }

        $transaction_ok = true;
        $posted_ip = $_SERVER['REMOTE_ADDR'];
        $old_address = $this->getitemlabel("userdata", "username", $username, "address");
        $daty = date("Y-m-d H:i:s");

        //log audit
        $log_query =  $this->myconn->query("INSERT INTO audit_trail  VALUES ('','userdata','$username','address','$old_address','$address','ADDR','$daty','$username','$posted_ip')");
        if ($this->myconn->affected_rows != 1) {
            $status = false;
        }


        $this->myconn->query("UPDATE userdata SET address = '$address', modified = '$daty' WHERE username = '$username' LIMIT 1");
        if ($this->myconn->affected_rows == 1) {
            return array('status' => '200', 'message' => 'Address has been updated successfully');
        } else {
            return array('status' => '404', 'message' => 'No change(s) made to the Account Profile');
        }
    }

    public function new_password($username, $old_password, $new_password, $posted_ip, $onlogon = 0)
    {

        $data = array(
            'username' => $username,
            'old_password' => $old_password,
            'new_password' => $new_password
        );
        $validate = $this->validate(
            $data,
            array('username' => 'required', 'old_password' => 'required', 'new_password' => 'required|min:8'),
            array('username' => 'Username', 'new_password' => 'Password', 'old_password' => 'Password')
        );

        $regex = $this->validateUserPassword($data['new_password']);

        if ($validate['error']) {
            return array(
                'status' => '420',
                'message' =>  $validate['messages'][0]
            );
        }

        if ($regex != 1) {
            return array(
                'status' => '425',
                'message' =>  $regex
            );
        }

        if (empty($old_password) || empty($new_password)) {
            return array(
                'status' => '421',
                'message' => " Both the current password and new password fields are required to change password"
            );
        }

        if ($old_password == $new_password) {
            return array(
                'status' => '423',
                'message' => "The current password and the new password cannot be the same"
            );
        }

        $originator = $this->myconn->query("SELECT email, password, username, role_name, firstname, lastname, passchg_logon FROM userdata WHERE username ='$username' LIMIT 1 ");
        $numrows = $originator->num_rows;

        if ($numrows == 0) {
            return array(
                'status' => '404',
                'message' => "The Specified User Account Does not Exist "
            );
        }


        $record = $originator->fetch_assoc();
        $username = $record['username'];
        $email = $record['email'];
        $role_name = ($record['role_name']) ? $record['role_name'] : 'UNDISCLOSED';
        $current_password = $record['password'];
        $fullname = $record['firstname'] . " " . $record['lastname'];
        $daty = date('Y-m-d H:i:s');
        $posted_ip = $_SERVER['REMOTE_ADDR'];


        if ($onlogon == 1 && $record['passchg_logon'] != 1) {
            return array(
                'status' => '422',
                'message' => "The Account does not have change password at LOGON turned on!"
            );
        }



        $desencrypt = new DESEncryption();
        $key = strtolower($username);
        $cipher_new_password = $desencrypt->des($key, $new_password, 1, 0, null, null);
        $str_cipher_new_password = $desencrypt->stringToHex($cipher_new_password);

        $cipher_old_password = $desencrypt->des($key, $old_password, 1, 0, null, null);
        $str_cipher_old_password = $desencrypt->stringToHex($cipher_old_password);

        if ($str_cipher_old_password !=  $current_password) {
            return array(
                'status' => '424',
                'message' => "The current password you entered is invalid "
            );
        }


        $status = true;
        $this->myconn->autocommit(false);


        $change_on_logon = ($onlogon == 1) ? ", passchg_logon = 0 " : "";


        //update password
        $changing = $this->myconn->query(" UPDATE userdata SET password = '$str_cipher_new_password', modified = '$daty' $change_on_logon WHERE password = '$str_cipher_old_password' AND username = '$username' LIMIT 1");
        if ($this->myconn->affected_rows != 1) {
            $status = false;
        }


        //log audit
        $log_query =  $this->myconn->query(" INSERT INTO audit_trail  VALUES ('','userdata','$username','password','$str_cipher_old_password','$str_cipher_new_password','chng','$daty','$username','$posted_ip')");
        if ($this->myconn->affected_rows != 1) {
            $status = false;
        }


        $logged = $this->activity_log('20', $username, $username, "Account Password Changed at Logon from $posted_ip");
        if ($logged == false) {
            $transaction_ok = false;
        }

        if ($status) {
            $this->myconn->commit();

            return array(
                'status' => '200',
                'message' => "Account Password Changed Successfully!"
            );
        } else {

            $this->myconn->rollback();
            return array(
                'status' => '501',
                'message' => "Unable to change account password "
            );
        }
    }


    //delete a role operation for a user
    public function deleteRoleOperation($system_code, $officer, $ip)
    {

        $operation = "del";

        $transaction_ok = true;
        $this->myconn->autocommit(FALSE);


        $before = $this->getitemlabelArr("menugroup", array("system_code"), array($system_code), "*");

        $update_query = "DELETE FROM menugroup WHERE system_code = '$system_code' LIMIT 1";
        $this->myconn->query($update_query);
        if (@$this->myconn->affected_rows != 1) {
            $transaction_ok = false;
        }

        $after = $this->getitemlabelArr("menugroup", array("system_code"), array($system_code), "*");

        //log changes locally
        $logged = $this->log_audit_trail("menugroup", $before, $after, $system_code, $officer, $ip, $operation);
        if (!$logged) {
            $transaction_ok = false;
        }

        if ($transaction_ok == true) {
            // echo "commit <br>";
            $this->myconn->commit();
            return true;
        } else {
            // echo "rollback<br>";
            $this->myconn->rollback();
            return false;
        }
    }
}//end class
