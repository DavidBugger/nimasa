<?php
// require 'vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Users extends dbobject
{

    // public function login($data)
    // {

    //     $username = $data['username'];
    //     $password = $data['password'];
    //     $validate = $this->validate(
    //         $data,
    //         array('username' => 'required|email', 'password' => 'required'),
    //         array('username' => 'Username', 'password' => 'Password')
    //     );
    //     if ($validate['error']) {
    //         return json_encode(array('response_code' => 13, 'response_message' => $validate['messages'][0]));
    //     }
    //     $sql      = "SELECT username,firstname,lastname,sex,role_id,password,user_locked,user_disabled,pin_missed,day_1,day_2,day_3,day_4,day_5,day_6,day_7,passchg_logon,photo,church_id FROM userdata WHERE username = '$username' LIMIT 1";
    //     $result   = $this->db_query($sql, true);
    //     $count    = count($result);
    //     if ($count > 0) {
    //         if ($result[0]['pin_missed'] < 5) {
    //             $encrypted_password = $result[0]['password'];
    //             $is_locked     = $result[0]['user_locked'];
    //             $is_disabled     = $result[0]['user_disabled'];
    //             // $verify_pass   = password_verify($password,$hash_password);

    //             $desencrypt = new AES();
    //             $key = $username;
    //             // $cipher_password = $desencrypt->des($key, $password, 1, 0, null,null);
    //             $str_cipher_password = $desencrypt->encrypt($password);
    //             if ($str_cipher_password == $encrypted_password) {
    //                 if ($is_disabled != 1) {
    //                     if ($is_locked != 1) {
    //                         $work_day = $this->workingDays($result[0]);
    //                         if ($work_day['code'] != "44") {
    //                             if ($result[0]['church_id'] != "99") {
    //                                 $church_details = $this->getItemLabelArr('church_table', array('church_id'), array($result[0]['church_id']), array('church_type', 'state', 'church_name'));
    //                                 $_SESSION['username_sess']   = $result[0]['username'];
    //                                 $_SESSION['firstname_sess']  = $result[0]['firstname'];
    //                                 $_SESSION['lastname_sess']   = $result[0]['lastname'];
    //                                 $_SESSION['sex_sess']        = $result[0]['sex'];
    //                                 $_SESSION['role_id_sess']    = $result[0]['role_id'];
    //                                 $_SESSION['church_id_sess']  = $result[0]['church_id'];
    //                                 $_SESSION['photo_file_sess']  = $result[0]['photo'];
    //                                 $_SESSION['photo_path_sess']  = "img/profile_photo/" . $result[0]['photo'];
    //                                 $_SESSION['church_type_id_sess'] = $church_details['church_type'];
    //                                 $_SESSION['state_id_sess'] = $church_details['state'];;
    //                                 $_SESSION['church_name_sess'] = $church_details['church_name'];;
    //                                 $_SESSION['role_id_name']    = $this->getitemlabel('role', 'role_id', $result[0]['role_id'], 'role_name');


    //                                 //update pin missed and last_login
    //                                 $this->resetpinmissed($username);
    //                                 return json_encode(array("response_code" => 0, "response_message" => "Login Successful"));
    //                             } else {
    //                                 return json_encode(array("response_code" => 779, "response_message" => "You can't login now... A profile transfer is currently ongoing. Try again at a later time or contact the Administrator"));
    //                             }
    //                         } else {
    //                             return json_encode(array("response_code" => 61, "response_message" => $work_day['mssg']));
    //                         }
    //                     } else {
    //                         //inform the user that the account has been locked, and to contact admin, user has to provide useful info b4 he is unlocked
    //                         return json_encode(array("response_code" => 60, "response_message" => "Your account has been locked, kindly contact the administrator."));
    //                     }
    //                 } else {
    //                     return json_encode(array("response_code" => 610, "response_message" => "Your user privilege has been revoked. Kindly contact the administrator"));
    //                 }
    //             } else {
    //                 $this->updatepinmissed($username);

    //                 $remaining = (($result[0]['pin_missed'] + 1) <= 5) ? (5 - ($result[0]['pin_missed'] + 1)) : 0;
    //                 return json_encode(array("response_code" => 90, "response_message" => "Invalid username or password, " . $remaining . " attempt remaining"));
    //             }
    //         } elseif ($result[0]['pin_missed'] == 5) {
    //             $this->updateuserlock($username, '1');
    //             return json_encode(array("response_code" => 64, "response_message" => "Your account has been locked, kindly contact the administrator."));
    //         } else {
    //             return json_encode(array("response_code" => 62, "response_message" => "Your account has been locked, kindly contact the administrator."));
    //         }
    //     } else {
    //         return json_encode(array("response_code" => 20, "response_message" => "Invalid username or password"));
    //     }
    // }


    // public function sendMail($data)
    // {

    //     $mail = new PHPMailer(true);
    //     $email = $data['email'];
    //     $firstname = $data['firstname'];
    //     $username   = $data['username'];
    //     $data = $data['reset_pwd_link'];
    //     $reset_pwd_link    = "SELECT reset_pwd_link  FROM userdata WHERE username = '$username'";
    //     $image = "https://drive.google.com/file/d/1_0-bsqJ-nd7zXSC1vLUJyPHwn3zZ9gMI/view";
    //     $mail_data = '<html>

    // 	<center>' . $image . '</center> <br>
    // 	<div style="background-color:#fff; width:100%; height:100%; margin:0px; padding:45px;">
    //             <div style="width:500px; background:white; margin:0px auto; padding:25px;">
    //                 <h2><center><img src="cid:logo" style="max-height:75px;"></center></h2>
    //                 <p style="background-color:#36b466; color:white; font-size:18px; text-align:center; padding:8px;">Park and Pay</p>
    //                 <h3 style="text-align:center;">Dear ' . $firstname . '</h3>
    //                 <p style="text-align:center;">Please click the following link below and activate reset your password  <br><center>http://localhost/park_and_pay/confirm_email.php?email=$email=' . $link . ' </center><br><center>Or copy and paste the link below in any web browser to activate your account </center>
    // 				<center><class="btn btn--radius-2 btn--green" style="text-align:center; color:#fff;"></button>
    // 				</p>
    //             </div>

    //         </div></html>';



    //     try {
    //         // $mail->SMTPDebug = 2;
    //         $mail->isSMTP();
    //         $mail->Host     = 'smtp.gmail.com;';
    //         $mail->SMTPAuth = true;
    //         $mail->Username = 'davidakanang@gmail.com';
    //         $mail->Password = 'fuppcwnanrijvvxt';
    //         $mail->SMTPSecure = 'tls';
    //         $mail->Port     = 587;

    //         $mail->setFrom('davidakanang@gmail.com', 'Park and Pay');
    //         $mail->addAddress($email);
    //         // $mail->addAddress('receiver2@gfg.com', 'Name');

    //         $mail->isHTML(true);
    //         $mail->Subject = 'Reset Your Email';
    //         $mail->Body = $mail_data;

    //         // $mail->AltBody = 'Body in plain text for non-HTML mail clients';

    //         if ($mail->send()) {
    //             return json_encode(array("response_message" => "mail sent successfully"));
    //         } else {
    //             return array('message' => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
    //         }
    //     } catch (Exception $e) {
    //     }


    //     // Get the user's email from the form
    //     // $email = $data['email'];

    //     // Generate a random confirmation token
    //     // $token = bin2hex(random_bytes(32));

    //     // Send the confirmation email
    //     // $to = $email;
    //     // $subject = 'Confirm your email address';
    //     // $message = "Please click the following link to confirm your email address: http://example.com/confirm.php?email=$email&token=$token";
    //     // $headers = 'From: Park&Pay.com' . "\r\n" .
    //     // 	'Reply-To: noreply@example.com' . "\r\n" .
    //     // 	'X-Mailer: PHP/' . phpversion();
    //     // $body = "Hello $email,$message";

    //     // if (mail($to, $subject, $message, $headers)) {
    //     // 	// If the email was sent successfully, display a message to the user
    //     // 	return json_encode(array("response_message" => "mail sent successfully"));
    //     // } else {
    //     // 	// If the email failed to send, display an error message to the user
    //     // 	return 'error';
    //     // }
    // }

    public function login($data)
    {
        // var_dump($data); exit;
        // $data['username'] = strtolower($data['username'] );
        $username = strtolower($data['username']);
        $password = $data['password'];
        $validate = $this->validate(
            $data,
            array('username' => 'required', 'password' => 'required'),
            array('username' => 'Username', 'password' => 'Password')
        );
        if ($validate['error']) {
            return json_encode(array('response_code' => 13, 'response_message' => $validate['messages'][0]));
        }
        $sql      = "SELECT username,firstname,lastname,sex,role_id,password,reg_status,user_locked,user_disabled,pin_missed,day_1,day_2,day_3,day_4,day_5,day_6,day_7,passchg_logon,photo,email FROM userdata WHERE username = '$username' LIMIT 1";
        $result   = $this->db_query($sql, true);
        $count    = count($result);
        if ($count > 0) {
            if ($result[0]['pin_missed'] < 5) {
                $encrypted_password = $result[0]['password'];
                $is_locked     = $result[0]['user_locked'];
                $is_disabled     = $result[0]['user_disabled'];
                $reg_status     = $result[0]['reg_status'];
                // $link = $result[0]['verify_email_token'];
                $data['email'] = $result[0]['email'];
                $data['lastname'] = $result[0]['lastname'];
                $data['invitation_link'] = $result[0]['invitation_link'];
                // var_dump($link);exit;
                // var_dump($reg_status);exit;
                // $verify_pass   = password_verify($password,$hash_password);

                $desencrypt = new DESEncryption();
                $key = $username;
                $cipher_password = $desencrypt->des($key, $password, 1, 0, null, null);
                $str_cipher_password = $desencrypt->stringToHex($cipher_password);
                // print_r($str_cipher_password."----".$encrypted_password); exit;

                if ($str_cipher_password == $encrypted_password)
                // if(1 == 1)
                {
                    if ($reg_status == 1) {
                        if ($is_disabled != 1) {
                            if ($is_locked != 1) {
                                $work_day = $this->workingDays($result[0]);
                                if ($work_day['code'] != "44") {
                                    if ($result[0]['church_id'] != "99") {
                                        // $church_details = $this->getItemLabelArr('church_table', array('church_id'), array($result[0]['church_id']), array('church_type', 'state', 'church_name'));
                                        $_SESSION['username_sess']   = $result[0]['username'];
                                        // $link = $result[0]['verify_email_token'];
                                        $_SESSION['firstname_sess']  = $result[0]['firstname'];
                                        $_SESSION['lastname_sess']   = $result[0]['lastname'];
                                        $_SESSION['sex_sess']        = $result[0]['sex'];
                                        $_SESSION['role_id_sess']    = $result[0]['role_id'];
                                        // $_SESSION['church_id_sess']  = $result[0]['church_id'];
                                        $_SESSION['photo_file_sess']  = $result[0]['photo'];
                                        $_SESSION['photo_path_sess']  = "img/profile_photo/" . $result[0]['photo'];
                                        // $_SESSION['church_type_id_sess'] = (isset($church_details['church_type'])) ? $church_details['church_type'] : 0;
                                        // $_SESSION['state_id_sess'] = (isset($church_details['state'])) ? $church_details['state'] : "FCT";
                                        // $_SESSION['church_name_sess'] = (isset($church_details['church_name'])) ? $church_details['church_name'] : "The lords Chosen";
                                        $_SESSION['role_id_name']    = $this->getitemlabel('role', 'role_id', $result[0]['role_id'], 'role_name');

                                        //update pin missed and last_login
                                        $this->resetpinmissed($username);
                                        return json_encode(array("response_code" => 0, "response_message" => "Login Successful"));
                                    } else {
                                        return json_encode(array("response_code" => 779, "response_message" => "You can't login now... A profile transfer is currently ongoing. Try again at a later time or contact the Administrator"));
                                    }
                                } else {
                                    return json_encode(array("response_code" => 61, "response_message" => $work_day['mssg']));
                                }
                            } else {
                                //inform the user that the account has been locked, and to contact admin, user has to provide useful info b4 he is unlocked
                                return json_encode(array("response_code" => 60, "response_message" => "Your account has been locked, kindly contact the administrator."));
                            }
                        } else {
                            return json_encode(array("response_code" => 610, "response_message" => "Your user privilege has been revoked. Kindly contact the administrator"));
                        }
                    } else {
                        $this->sendMail($data);
                        return json_encode(array("response_code" => 900, "response_message" => "Oops, your account has not been activated,check your mail to activate it "));
                    }
                } else {
                    $this->updatepinmissed($username);

                    $remaining = (($result[0]['pin_missed'] + 1) <= 5) ? (5 - ($result[0]['pin_missed'] + 1)) : 0;
                    return json_encode(array("response_code" => 90, "response_message" => "Invalid username or password, " . $remaining . " attempt remaining"));
                }
            } elseif ($result[0]['pin_missed'] == 5) {
                $this->updateuserlock($username, '1');
                return json_encode(array("response_code" => 64, "response_message" => "Your account has been locked, kindly contact the administrator."));
            } else {
                return json_encode(array("response_code" => 62, "response_message" => "Your account has been locked, kindly contact the administrator."));
            }
        } else {
            return json_encode(array("response_code" => 20, "response_message" => "Invalid username or password"));
        }
    }



    public function roadmarshallogin($data)
    {
        // var_dump($data); exit;
        // $data['username'] = strtolower($data['username'] );
        $username = strtolower($data['username']);
        $password = $data['password'];
        $validate = $this->validate(
            $data,
            array('username' => 'required', 'password' => 'required'),
            array('username' => 'Username', 'password' => 'Password')
        );
        if ($validate['error']) {
            return json_encode(array('response_code' => 13, 'response_message' => $validate['messages'][0]));
        }
        $sql      = "SELECT username,firstname,lastname,sex,role_id,password,reg_status,user_locked,user_disabled,pin_missed,day_1,day_2,day_3,day_4,day_5,day_6,day_7,passchg_logon,photo, FROM userdata WHERE username = '$username' LIMIT 1";
        $result   = $this->db_query($sql, true);
        $count    = count($result);
        if ($count > 0) {
            if ($result[0]['pin_missed'] < 5) {
                $encrypted_password = $result[0]['password'];
                $is_locked     = $result[0]['user_locked'];
                $is_disabled     = $result[0]['user_disabled'];
                $reg_status     = $result[0]['reg_status'];
                // $link = $result[0]['verify_email_token'];
                // $data['email'] = $result[0]['email'];
                // $data['lastname'] = $result[0]['lastname'];
                // $data['invitation_link'] = $result[0]['invitation_link'];
                // var_dump($link);exit;
                // var_dump($reg_status);exit;
                // $verify_pass   = password_verify($password,$hash_password);

                $desencrypt = new DESEncryption();
                $key = $username;
                $cipher_password = $desencrypt->des($key, $password, 1, 0, null, null);
                $str_cipher_password = $desencrypt->stringToHex($cipher_password);
                // print_r($str_cipher_password."----".$encrypted_password); exit;

                if ($str_cipher_password == $encrypted_password)
                // if(1 == 1)
                {
                    if ($reg_status == 1) {
                        if ($is_disabled != 1) {
                            if ($is_locked != 1) {
                                $work_day = $this->workingDays($result[0]);
                                if ($work_day['code'] != "44") {
                                    if ($result[0]['church_id'] != "99") {
                                        $church_details = $this->getItemLabelArr('church_table', array('church_id'), array($result[0]['church_id']), array('church_type', 'state', 'church_name'));
                                        $_SESSION['username_sess']   = $result[0]['username'];
                                        // $link = $result[0]['verify_email_token'];
                                        $_SESSION['firstname_sess']  = $result[0]['firstname'];
                                        $_SESSION['lastname_sess']   = $result[0]['lastname'];
                                        $_SESSION['sex_sess']        = $result[0]['sex'];
                                        $_SESSION['role_id_sess']    = $result[0]['role_id'];
                                        $_SESSION['church_id_sess']  = $result[0]['church_id'];
                                        $_SESSION['photo_file_sess']  = $result[0]['photo'];
                                        $_SESSION['photo_path_sess']  = "img/profile_photo/" . $result[0]['photo'];
                                        $_SESSION['church_type_id_sess'] = (isset($church_details['church_type'])) ? $church_details['church_type'] : 0;
                                        $_SESSION['state_id_sess'] = (isset($church_details['state'])) ? $church_details['state'] : "FCT";
                                        $_SESSION['church_name_sess'] = (isset($church_details['church_name'])) ? $church_details['church_name'] : "The lords Chosen";
                                        $_SESSION['role_id_name']    = $this->getitemlabel('role', 'role_id', $result[0]['role_id'], 'role_name');


                                        //update pin missed and last_login
                                        $this->resetpinmissed($username);
                                        return json_encode(array("response_code" => 0, "response_message" => "Login Successful"));
                                    } else {
                                        return json_encode(array("response_code" => 779, "response_message" => "You can't login now... A profile transfer is currently ongoing. Try again at a later time or contact the Administrator"));
                                    }
                                } else {
                                    return json_encode(array("response_code" => 61, "response_message" => $work_day['mssg']));
                                }
                            } else {
                                //inform the user that the account has been locked, and to contact admin, user has to provide useful info b4 he is unlocked
                                return json_encode(array("response_code" => 60, "response_message" => "Your account has been locked, kindly contact the administrator."));
                            }
                        } else {
                            return json_encode(array("response_code" => 610, "response_message" => "Your user privilege has been revoked. Kindly contact the administrator"));
                        }
                    } else {
                        // $this->sendMail($data);
                        return json_encode(array("response_code" => 900, "response_message" => "Oops, your account has not been activated,check your mail to activate it "));
                    }
                } else {
                    $this->updatepinmissed($username);

                    $remaining = (($result[0]['pin_missed'] + 1) <= 5) ? (5 - ($result[0]['pin_missed'] + 1)) : 0;
                    return json_encode(array("response_code" => 90, "response_message" => "Invalid username or password, " . $remaining . " attempt remaining"));
                }
            } elseif ($result[0]['pin_missed'] == 5) {
                $this->updateuserlock($username, '1');
                return json_encode(array("response_code" => 64, "response_message" => "Your account has been locked, kindly contact the administrator."));
            } else {
                return json_encode(array("response_code" => 62, "response_message" => "Your account has been locked, kindly contact the administrator."));
            }
        } else {
            return json_encode(array("response_code" => 20, "response_message" => "Invalid username or password"));
        }
    }


    // function that handles files uploads for me
    function handleFileUpload()
    {

        if (isset($_FILES['fileToUpload'])) {
            $target_dir = "uploads/";
            $target_file = $target_dir . basename($_FILES['fileToUpload']['name']);
            $uploadOk = 1;
            $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

            // Check if file already exists
            if (file_exists($target_file)) {
                echo "Sorry, file already exists.";
                $uploadOk = 0;
            }

            // Check file size
            if ($_FILES['fileToUpload']['size'] > 500000) {
                echo "Sorry, your file is too large.";
                $uploadOk = 0;
            }

            // Allow certain file formats
            if (
                $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                && $imageFileType != "gif"
            ) {
                echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                $uploadOk = 0;
            }

            // Check if $uploadOk is set to 0 by an error
            if ($uploadOk == 0) {
                echo "Sorry, your file was not uploaded.";
                // if everything is ok, try to upload file
            } else {
                if (move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $target_file)) {
                    echo "The file " . htmlspecialchars(basename($_FILES['fileToUpload']['name'])) . " has been uploaded.";
                } else {
                    echo "Sorry, there was an error uploading your file.";
                }
            }
        }
    }

    // funtion that handles multiple files upload

    function handleMultipleFileUpload()
    {

        if (isset($_FILES['fileToUpload'])) {
            $target_dir = "uploads/";
            $uploadOk = 1;

            // Loop through each uploaded file
            for ($i = 0; $i < count($_FILES['fileToUpload']['name']); $i++) {
                $target_file = $target_dir . basename($_FILES['fileToUpload']['name'][$i]);
                $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

                // Check if file already exists
                if (file_exists($target_file)) {
                    echo "Sorry, file already exists.";
                    $uploadOk = 0;
                }

                // Check file size
                if ($_FILES['fileToUpload']['size'][$i] > 500000) {
                    echo "Sorry, your file is too large.";
                    $uploadOk = 0;
                }

                // Allow certain file formats
                if (
                    $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                    && $imageFileType != "gif"
                ) {
                    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                    $uploadOk = 0;
                }

                // Check if $uploadOk is set to 0 by an error
                if ($uploadOk == 0) {
                    echo "Sorry, your file was not uploaded.";
                    // if everything is ok, try to upload file
                } else {
                    if (move_uploaded_file($_FILES['fileToUpload']['tmp_name'][$i], $target_file)) {
                        echo "The file " . htmlspecialchars(basename($_FILES['fileToUpload']['name'][$i])) . " has been uploaded.";
                    } else {
                        echo "Sorry, there was an error uploading your file.";
                    }
                }
            }
        }
    }




    public function sendMail($data)
    {
        $mail = new PHPMailer(true);

        $email = $data['email'];
        $firstname = $data['lastname'];
        $verify_email_token = $data['token'];
        // var_dump($data);exit;
        // Add the image as an attachment

        $mail_data = '<html>
		<div style="background-color:#f2f2f2; width:100%; height:100%; margin:0px; padding:45px;">
                <div style="width:500px; background:white; margin:0px auto; padding:25px;">
                    <h2><center><img src="cid:image1" style="max-height:75px;"></center></h2>
                    <p style="background-color:#36b466; color:white; font-size:18px; text-align:center; padding:8px;">Park and Pay</p>
                    <h3 style="text-align:center;">Dear ' . $firstname . '</h3>
                    <p style="text-align:center;">Please click the  link below to confirm  and activate your account: <br><center><a href="http://localhost/park_and_pay/confirm_email.php?verify_email_token=' . $verify_email_token . '">http://localhost/park_and_pay/confirm_email.php?verify_email_token=' . $verify_email_token . '</a> </center><br>
					<center><a href="http://localhost/park_and_pay/confirm_email.php?verify_email_token=' . $verify_email_token . '" style="background-color:#36b466; font-family:serif; color:white; font-size:18px; text-align:center; padding:8px; text-decoration:none; width: 100%;">Verify your Email</a></center>
					</p>
					
                </div>
            
            </div></html>';


        // Set the email content type to HTML
        // $mail->isHTML(true);

        // $mail->SMTPDebug = 2;
        $mail->isSMTP();
        $mail->Host     = 'smtp.gmail.com;';
        $mail->SMTPAuth = true;
        $mail->Username = 'davidakanang@gmail.com';
        $mail->Password = 'usqpvgpeflcaqsce';
        $mail->SMTPSecure = 'tls';
        $mail->Port     = 587;
        $image = 'assets/img/ereg.png';
        $imageName = 'My image';
        // $mail->addAttachment($image);
        $mail->addEmbeddedImage($image, 'image1', $imageName);

        $mail->setFrom('davidakanang@gmail.com', 'Park and Pay');
        $mail->addAddress($email);
        // $mail->addAddress('receiver2@gfg.com', 'Name');

        $mail->isHTML(true);
        $mail->Subject = 'Confirm Your Email';
        $mail->Body = $mail_data;

        // $mail->AltBody = 'Body in plain text for non-HTML mail clients';

        if ($mail->send()) {
            return json_encode(array("response_message" => "mail sent successfully"));
        } else {
            return array('message' => "Activation link  could not be sent. Mailer Error: {$mail->ErrorInfo}");
        }
    }

    public function userlist($data)
    {
        $table_name    = "userdata";
        $primary_key   = "username";
        $columner = array(
            array('db' => 'username', 'dt' => 0),
            array('db' => 'username', 'dt' => 1),
            array('db' => 'firstname',  'dt' => 2),
            array('db' => 'lastname',   'dt' => 3),
            // array('db' => 'username',   'dt' => 4, 'formatter' => function ($d, $row) {
            //     return  $this->getitemlabel('church_table', 'church_id', $row['church_id'], 'address');
            // }),
            // array('db' => 'username', 'dt' => 4, 'formatter' => function ($d, $row) {
            // 	return '<a class="btn btn-warning" onclick="loadModal(\'setup/users.php?op=edit&username=' . $d . '\',\'modal_div\')"  href="javascript:void(0)"  data-toggle="modal" data-target="#defaultModalPrimary">Edit User</a> ';
            // }),

            array('db' => 'mobile_phone',   'dt' => 4),
            array('db' => 'role_id',   'dt' => 5, 'formatter' => function ($d, $row) {
                return  $this->getitemlabel('role', 'role_id', $d, 'role_name');
            }),
            array('db' => 'email',   'dt' => 6),
            array('db' => 'pin_missed',   'dt' => 7),
            array('db' => 'user_disabled',   'dt' => 8, 'formatter' => function ($d, $row) {
                return ($d == 1) ? 'Disabled' : 'Enabled';
            }),
            array('db' => 'username',   'dt' => 9, 'formatter' => function ($d, $row) {
                $locking = ($row['user_disabled'] == 1) ? "Enable User" : "Disable User";
                $locking_class = ($row['user_disabled'] == 1) ? "btn-success" : "btn-danger";
                if ($_SESSION['role_id_sess'] == 001) {
                    $sack = ($row['status'] == "1") ? "<span onclick=\"sackUser('$d','$row[status]')\" style='cursor:pointer' class='badge bg-success'>Recall User</span>" : "<span onclick=\"sackUser('$d','$row[status]')\" style='cursor:pointer ' class='badge bg-primary'>Sack User</span>";
                    return  $sack;
                }
            }),
            array('db' => 'username',   'dt' => 10, 'formatter' => function ($d, $row) {
                $locking = ($row['user_disabled'] == 1) ? "Enable User" : "Disable User";
                $locking_class = ($row['user_disabled'] == 1) ? "btn-success" : "btn-danger";
                if ($_SESSION['role_id_sess'] == 001) {
                    return
                        "<a class='btn btn-sm btn-warning'   onclick=\"loadModal('setup/users.php?op=edit&username=" . $d . "','modal_div')\"  href=\"javascript:void(0)\" data-toggle=\"modal\" data-target=\"#defaultModalPrimary\" style = 'background:'>Edit  User</a>";
                }
            }),
            array('db' => 'username',   'dt' => 11, 'formatter' => function ($d, $row) {
                $locking = ($row['user_disabled'] == 1) ? "Enable User" : "Disable User";
                $locking_class = ($row['user_disabled'] == 1) ? "btn-success" : "btn-danger";
                if ($_SESSION['role_id_sess'] == 001) {

                    return  "<button onclick=\"trigUser('" . $d . "','" . $row['user_disabled'] . "')\" class='btn btn-sm " . $locking_class . "'>" . $locking . "</button>";
                }
            }),

            array('db' => 'created',   'dt' => 12)
        );
        // $filter = " AND role_id <> '001' AND role_id <> '$_SESSION[role_id_sess]'";
        // $church_users_filter = ($_SESSION['role_id_sess'] == '001' || $_SESSION['role_id_sess'] == '005') ? "" : "AND church_id = '$_SESSION[church_id_sess]'";
        // $filter = $filter . $church_users_filter;
        $datatableEngine = new engine();

        echo $datatableEngine->generic_table($data, $table_name, $columner, $primary_key);
    }

    public function forgotPassword($email, $firstname, $link)
    {
        $username = $_REQUEST['username'];
        $mail = new PHPMailer(true);
        $mail_data = '<html>
		<div style="background-color:#f2f2f2; width:100%; height:100%; margin:0px; padding:45px;">
                <div style="width:500px; background:white; margin:0px auto; padding:25px;">
                    <h2><center><img src="cid:image1" style="max-height:75px;"></center></h2>
                    <p style="background-color:#183153; color:white; font-size:18px; text-align:center; padding:8px;">Directorate of Entrepreneurship & Skill Development</p>
                    <h3 style="text-align:left;">Dear ' . $username . '</h3>
                    <p style="text-align:left;">Please click on the following link to reset your password: <br>http://localhost/desdl/pwd_reset.php?reset_pwd_link=' . $link . ' <br>
					<center><a href="http://localhost/desdl/pwd_reset.php?reset_pwd_link=' . $link . '" style="background-color:#000089; font-family:Montserrat; color:white; font-size:18px; text-align:center; padding:8px; text-decoration:none; width: 100%;">Reset your password</a></center>
					</p> 
                    <br>
                    <p style = "font-weight:bold;">Park & Pay Team </p>
                </div>
            
            </div></html>';
        // Set the email content type to HTML
        $mail->isHTML(true);
        // $mail->SMTPDebug = 2;
        $mail->isSMTP();
        $mail->Host     = 'smtp.gmail.com;';
        $mail->SMTPAuth = true;
        $mail->Username = 'davidakanang@gmail.com';
        $mail->Password = 'fifo gzax mnhz ofka';
        $mail->SMTPSecure = 'tls';
        $mail->Port     = 587;
        $image = 'src\images\bg\logo.png';
        $imageName = 'Logo';
        // $mail->addAttachment($image);
        $mail->addEmbeddedImage($image, 'image1', $imageName);
        $mail->setFrom('davidakanang@gmail.com', 'DESDL-Reset Password');
        // var_dump($data);exit;
        $mail->addAddress($email);
        // $mail->addAddress('receiver2@gfg.com', 'Name');
        // $mail->isHTML(true);
        $mail->Subject = 'Reset your Password';
        $mail->Body = $mail_data;

        // $mail->AltBody = 'Body in plain text for non-HTML mail clients';

        if ($mail->send()) {
            return json_encode(array("response_message" => "mail sent successfully"));
        } else {
            return array('message' => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
        }
    }

    public function resendconfirmLink($email, $lastname, $verify_email_token)
    {

        $mail = new PHPMailer(true);
        // Add the image as an attachment
        $mail_data = '<html>
		<div style="background-color:#f2f2f2; width:100%; height:100%; margin:0px; padding:45px;">
                <div style="width:500px; background:white; margin:0px auto; padding:25px;">
                    <h2><center><img src="cid:image1" style="max-height:75px;"></center></h2>
                    <p style="background-color:#36b466; color:white; font-size:18px; text-align:center; padding:8px;">Park and Pay</p>
                    <h3 style="text-align:center;">Dear ' . $lastname . '</h3>
                    <p style="text-align:center;">Please click on the following link to reset your password: <br><center>http://localhost/park_and_pay/confirm_email.php?verify_email_token=' . $verify_email_token . ' </center><br>
					<center><a href="http://localhost/park_and_pay/confirm_email.php?verify_email_token=' . $verify_email_token . '" style="background-color:#36b466; font-family:serif; color:white; font-size:18px; text-align:center; padding:8px; text-decoration:none; width: 100%;">Reset your password</a></center>
					</p>
                </div>
            
            </div></html>';
        // Set the email content type to HTML

        $mail->isHTML(true);

        // $mail->SMTPDebug = 2;
        $mail->isSMTP();
        $mail->Host     = 'smtp.gmail.com;';
        $mail->SMTPAuth = true;
        $mail->Username = 'davidakanang@gmail.com';
        $mail->Password = 'usqpvgpeflcaqsce';
        $mail->SMTPSecure = 'tls';
        $mail->Port     = 587;
        $image = 'assets/img/ereg.png';
        $imageName = 'My image';
        // $mail->addAttachment($image);
        $mail->addEmbeddedImage($image, 'image1', $imageName);

        $mail->setFrom('davidakanang@gmail.com', 'Park and Pay');
        // var_dump($data);exit;
        $mail->addAddress($email);
        // $mail->addAddress('receiver2@gfg.com', 'Name');

        // $mail->isHTML(true);
        $mail->Subject = 'Reset your Password';
        $mail->Body = $mail_data;

        // $mail->AltBody = 'Body in plain text for non-HTML mail clients';

        if ($mail->send()) {
            return json_encode(array("response_message" => "mail sent successfully"));
        } else {
            return array('message' => "Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
        }
    }


    public function fetchgeneratedPwdLink($data)
    {


        $username    = $data['username'];
        $verify_email_token    = $data['verify_email_token'];


        $sql                    = "SELECT username,verify_email_token,lastname,email FROM userdata WHERE username = '$username'";

        $rr                     = $this->db_query($sql);
        // var_dump($data['verify_email_token']);exit;

        if (count($rr) > 0) {

            if (filter_var($rr[0]['email'], FILTER_VALIDATE_EMAIL)) {
                // $data['email'] = $rr[0]['email'];
                $data                   = $username . "::" . date('Y-m-d h:i:s');
                $desencrypt             = new DESEncryption();
                $key                    = "accessis4life_tlc";
                $cipher_password        = $desencrypt->des($key, $data, 1, 0, null, null);
                // $sqltr_cipher_password  = $desencrypt->stringToHex($cipher_password);
                // $link                   = $sqltr_cipher_password;
                $val                    = $this->getitemlabelarr("userdata", array('username'), array($username), array('firstname', 'lastname', 'email'));
                $firstname              = (isset($val["firstname"])) ? $val['firstname'] : "";
                $lastname               = (isset($val["lastname"])) ? $val['lastname'] : "";
                $email                  = (isset($val["email"])) ? $val['email'] : "";
                $verify_email_token =   $data['verify_email_token'];
                // var_dump($verify_email_token);exit;
                $sql                    = "UPDATE userdata SET verify_email_token = '$verify_email_token' WHERE username = '$username' LIMIT 1";

                $this->db_query($sql, false);
                // var_dump($rr);exit;
                // print_r($rr[0]['email']); exit;
                $mail_resp = $this->resendconfirmLink($rr[0]['email'], $rr[0]['lastname'], $verify_email_token);
                return json_encode(array('mail response' => $mail_resp, 'response_code' => 0, 'response_message' => 'Your confirmation token has been resend to your email.'));
            } else {
                return json_encode(array('response_code' => 340, 'response_message' => 'Your email address was not setup properly'));
            }
        } else {
            return json_encode(array('response_code' => 940, 'response_message' => 'Username does not exist'));
        }
    }



    public function generatePwdLink($data)
    {
        // var_dump($data);exit;

        $username    = $data['username'];
        // var_dump($username);exit;
        $sql         = "SELECT username,lastname,email FROM userdata WHERE username = '$username'";
        $rr          = $this->db_query($sql);
        if (count($rr) > 0) {
            if (filter_var($rr[0]['email'], FILTER_VALIDATE_EMAIL)) {
                // $data['email'] = $rr[0]['email'];
                $data                   = $username . "::" . date('Y-m-d h:i:s');
                $desencrypt             = new DESEncryption();
                $key                    = "accessis4life_tlc";
                $cipher_password        = $desencrypt->des($key, $data, 1, 0, null, null);
                $sqltr_cipher_password  = $desencrypt->stringToHex($cipher_password);
                $link                   = $sqltr_cipher_password;
                $val                    = $this->getitemlabelarr("userdata", array('username'), array($username), array('firstname', 'lastname', 'email'));
                $firstname              = (isset($val["firstname"])) ? $val['firstname'] : "";
                $lastname               = (isset($val["lastname"])) ? $val['lastname'] : "";
                $email                  = (isset($val["email"])) ? $val['email'] : "";
                $sql                    = "UPDATE userdata SET reset_pwd_link = '$link' WHERE username = '$username' LIMIT 1";
                $this->db_query($sql, false);
                // var_dump($rr);exit;
                // print_r($rr[0]['email']); exit;
                $mail_resp = $this->forgotPassword($rr[0]['email'], $rr[0]['lastname'], $link);
                return json_encode(array('mail response' => $mail_resp, 'response_code' => 0, 'response_message' => 'Follow the reset link sent to your email'));
            } else {
                return json_encode(array('response_code' => 340, 'response_message' => 'Your email address was not setup properly'));
            }
        } else {
            return json_encode(array('response_code' => 940, 'response_message' => 'Username does not exist'));
        }
    }

    public function verifyLink($link)
    {
        $desencrypt      = new DESEncryption();
        $key             = "accessis4life_tlc";
        $json_value      = $this->DecryptData($key, $link);
        $arr             = explode("::", $json_value);
        $date            = $arr[1];
        $username        = $arr[0];
        $sql = "SELECT reset_pwd_link,firstname,lastname FROM userdata WHERE username = '$username' AND reset_pwd_link = '$link' LIMIT 1";
        $result = $this->db_query($sql);

        $count = (!empty($result)) ? count($result) : 0;
        if ($count > 0) {
            $date1  = strtotime($date);
            $date2  = strtotime(date('Y-m-d h:i:s'));
            // Formulate the Difference between two dates 
            $diff   = abs($date2 - $date1);
            // To get the year divide the resultant date into 
            // total seconds in a year (365*60*60*24) 
            $years  = floor($diff / (365 * 60 * 60 * 24));
            $months = floor(($diff - $years * 365 * 60 * 60 * 24) / (30 * 60 * 60 * 24));
            $days   = floor(($diff - $years * 365 * 60 * 60 * 24 - $months * 30 * 60 * 60 * 24) / (60 * 60 * 24));
            $hours  = floor(($diff - $years * 365 * 60 * 60 * 24 - $months * 30 * 60 * 60 * 24 - $days * 60 * 60 * 24) / (60 * 60));
            if ($hours > 72) {
                return json_encode(array('response_code' => 88, 'response_message' => 'This link has expired'));
            } else {
                $sql = "UPDATE userdata SET reset_pwd_link = '' WHERE username = '$username' LIMIT 1";
                $this->db_query($sql, false);
                return json_encode(array('response_code' => 0, 'response_message' => 'OK', 'data' => array('username' => $username, 'firstname' => $result[0]['firstname'], 'lastname' => $result[0]['lastname'])));
            }
        } else {
            return json_encode(array('response_code' => 848, 'response_message' => 'This link has already been used or tampared with'));
        }
    }



    public function register($data)
    {
        $validation = $this->validate(
            $data,
            array(
                'username' => 'required|unique:userdata.username',
                'password' => 'required',
                'firstname' => 'required',
                'lastname' => 'required',
                'email' => 'required|email',
                'area_id' => 'required',
                'mobile_phone' => 'required|int',
                'sex' => 'required'
            ),
            array(
                'username' => 'Username',
                'password' => 'Password',
                'firstname' => 'First Name',
                'lastname' => 'Last name',
                'email' => 'Email',
                'area_id' => 'Allocate Area',
                'mobile_phone' => 'Phone Number',
                'sex' => 'Gender'
            )
        );

        
        $email = $data['email'];
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return json_encode(["response_code" => 203, "response_message" => "Invalid email format"]);
        }

        $mobile_phone = $data['mobile_phone'];
        if (strlen($mobile_phone) < 11) {
            return json_encode(["response_code" => 204, "response_message" => "Mobile Phone must be 11 digits"]);
        }
        
        if (!$validation['error']) {
            if ($data["operation"] == "new") {
                // check if record does not exist before inserting
                $data['day_1'] = (isset($data['day_1'])) ? 1 : 0;
                $data['day_2'] = (isset($data['day_2'])) ? 1 : 0;
                $data['day_3'] = (isset($data['day_3'])) ? 1 : 0;
                $data['day_4'] = (isset($data['day_4'])) ? 1 : 0;
                $data['day_5'] = (isset($data['day_5'])) ? 1 : 0;
                $data['day_6'] = (isset($data['day_6'])) ? 1 : 0;
                $data['day_7'] = (isset($data['day_7'])) ? 1 : 0;
                $data['passchg_logon'] = (isset($data['passchg_logon'])) ? 1 : 0;
                $data['user_disabled'] = (isset($data['user_disabled'])) ? 1 : 0;
                $data['user_locked']   = (isset($data['user_locked'])) ? 1 : 0;
                $data['posted_user'] = $_SESSION['username_sess'];
                $data['email'] = $data['email'];
                $data['created'] = date('Y-m-d h:i:s');
                $desencrypt = new DESEncryption();
                $key = $data['username'];
                $cipher_password = $desencrypt->des($key, $data['password'], 1, 0, null, null);
                $str_cipher_password = $desencrypt->stringToHex($cipher_password);
                $data['password'] = $str_cipher_password;
                $data['role_name'] = "Road Marshal";
                $data['role_id'] = "015";
                $role_id = $data['role_id'];
                $data['role_id'] = $role_id;
                $data['created'] =  DATE('Y:m:d H:i:s');
                $sql = "SELECT username FROM userdata WHERE role_id = '$data[role_id]' LIMIT 1";
                $role_cnt = $this->db_query($sql, false);
                $road_marshal_initial_bal = "0";
                $license_operator_id = $data['posted_user'];
                $data['license_operator_id'] = $license_operator_id;
                $data_array = array(
                    "road_marshal_id" => $data['username'],
                    "road_marshal_balance" => $road_marshal_initial_bal,
                    "license_operator_id" => $data['license_operator_id'],
                    "date_created" => $data['created']
                );
                $area_id = $data['area_id'];
                $strt_code = $this->getitemlabel('streets', 'street_code', $area_id, 'street_code');
                $data['street_code'] = $strt_code;
                // if ($role_cnt > 1) {
                $count = $this->doInsert('userdata', $data, array('op', 'passchg_logon', 'user_disabled', 'user_locked',  'posted_user', 'operation', 'nrfa-csrf-token-label'));
                $count = $this->doInsert('wallet_balance', $data_array, array('op', 'confirm_password', 'day_1', 'day_2', 'day_3', 'day_4', 'day_5', 'day_6', 'day_7', 'passchg_logon', 'user_disabled', 'user_locked', 'role_id', 'sex', 'posted_user', 'operation', 'nrfa-csrf-token-label'));
                if ($count > 0) {
                    return json_encode(array("response_code" => 0, "response_message" => 'Record saved successfully'));
                } else {
                    return json_encode(array("response_code" => 78, "response_message" => 'Failed to save record'));
                }
                // }

            }
        } else {

            return json_encode(array("response_code" => 34, "response_message" => $validation['messages'][0]));
        }
    }

    public function userEdit($data)
    {
        $data['day_1'] = (isset($data['day_1'])) ? 1 : 0;
        $data['day_2'] = (isset($data['day_2'])) ? 1 : 0;
        $data['day_3'] = (isset($data['day_3'])) ? 1 : 0;
        $data['day_4'] = (isset($data['day_4'])) ? 1 : 0;
        $data['day_5'] = (isset($data['day_5'])) ? 1 : 0;
        $data['day_6'] = (isset($data['day_6'])) ? 1 : 0;
        $data['day_7'] = (isset($data['day_7'])) ? 1 : 0;
        $data['passchg_logon'] = (isset($data['passchg_logon'])) ? 1 : 0;
        $data['user_disabled'] = (isset($data['user_disabled'])) ? 1 : 0;
        $data['user_locked'] = (isset($data['user_locked'])) ? 1 : 0;

        $validate = $this->validate(
            $data,
            array('role_id' => 'required', 'area_id' => 'required'),
            array('role_id' => 'Role', 'area_id' => 'Area')
        );
        if ($validate['error']) {
            return json_encode(array('response_code' => 13, 'response_message' => $validate['messages'][0]));
        } else {
            $cnt = $this->doUpdate('userdata', $data, array('op', 'operation', 'nrfa-csrf-token-label'), array('username' => $data['username']));
            if ($cnt == 1) {
                return json_encode(array("response_code" => 0, "response_message" => 'Record Updated successfully'));
            } else {
                return json_encode(array("response_code" => 78, "response_message" => 'Failed to Update Record'));
            }
        }
    }


    public function profileEdit($data)
    {
        $validate = $this->validate(
            $data,
            array('username' => 'required|email', 'firstname' => 'required', 'lastname' => 'required', 'mobile_phone' => 'required', 'sex' => 'required'),
            array('username' => 'Username', 'mobile_phone' => 'Phone Number', 'firstname' => 'First Name', 'lastname' => 'Last Name', 'sex' => 'Gender')
        );
        if (!$validate['error']) {
            $cnt = $this->doUpdate('userdata', $data, array('op', 'operation', 'nrfa-csrf-token-label'), array('username' => $data['username']));
            if ($cnt == 1) {
                return json_encode(array("response_code" => 0, "response_message" => 'Record saved successfully'));
            } else {
                return json_encode(array("response_code" => 78, "response_message" => 'No update was made'));
            }
        } else {
            return json_encode(array('response_code' => 13, 'response_message' => $validate['messages'][0]));
        }
    }
    public function saveUser($data)
    {
        $role_id = $data['role_id'];
        $data['parish_pastor'] = 1;
        $validation = array();
        // $getmax_id = "SELECT MAX(marshal_id) as marshid FROM vehicle_park";
        // 	$d = $this->db_query($getmax_id);

        // 	$data['marshal_id'] = str_pad($d[0]['marshid'] + 1, 6, "000000", STR_PAD_LEFT);
        //     var_dump($data['marshal_id']);exit;

        // $data['license_operator_id'] = $_SESSION['username_sess'];

        if ($role_id == 003) {
            if ($data['parish_pastor'] == "1") {
                $validation = $this->validate(
                    $data,
                    array(
                        'church_id'    => 'required',
                        'bank_name'    => 'required',
                        'account_name' => 'required',
                        'account_no'   => 'required'
                    ),
                    array('account_no' => 'Account Number', 'account_name' => 'Account Name', 'bank_name' => 'Bank Name', 'church_id' => 'church')
                );
                if (!$validation['error']) {
                    if ($data['operation'] == "new") {
                        $sql = "SELECT username,firstname,lastname FROM userdata WHERE role_id = '003' AND parish_pastor='1' AND church_id = '$data[church_id]' LIMIT 1 ";
                        $resu = $this->db_query($sql);
                        if (count($resu) > 0) {
                            $church_name = $this->getitemlabel('church_table', 'church_id', $data['church_id'], 'church_name');
                            $pastor_name = $resu[0]['firstname'] . " " . $resu[0]['lastname'];
                            $validation['error'] = true;
                            $validation['messages'][0] = $church_name . " already has a parish pastor[" . $pastor_name . "] there can only be one parish pastor. ";
                        }
                    }
                }
            } else {
                $validation = $this->validate(
                    $data,
                    array(
                        'church_id'    => 'required'
                    ),
                    array('church_id' => 'church')
                );
            }
        } else {
            $validation['error'] = false;
        }

        if (!$validation['error']) {
            return $this->register($data);
        } else {
            return json_encode(array("response_code" => 20, "response_message" => $validation['messages'][0]));
        }
    }
    public function workingDays($dbrow)
    {
        $days_of_week = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
        $db_day       = array('day_1', 'day_2', 'day_3', 'day_4', 'day_5', 'day_6', 'day_7');
        $ddate        = date('w');
        $mssg         = array('code' => 0, 'mssg' => '');
        foreach ($days_of_week as $k => $v) {
            if ($dbrow[$db_day[$k]] == 0 && $ddate == $k) {
                $mssg = array("mssg" => "You are not allowed to login on $days_of_week[$k]", "code" => "44");
            }
        }
        if ($dbrow['passchg_logon'] == '1') {
            $mssg = array("mssg" => "You are required to change your password, follow this link to  <a href='change_psw_logon.php?username={$dbrow['username']}'> change password </a>", "code" => "44");
        }
        return $mssg;
    }
    public function emailPasswordReset($data)
    {
        $email = $data['email'];
        $today = @date("Y-m-d H:i:s");
        $pass_dateexpire = @date("Y-m-d H:i:s", strtotime($today . "+ 24 hours"));
        $upd = $this->db_query("UPDATE userdata SET pwd_expiry='" . $pass_dateexpire . "' WHERE username = '$email'");


        $recordBiodata = $this->getItemLabelArr('userdata', array('email'), array($email), '*');

        $fname = $recordBiodata['first_name'];
        $lname = $recordBiodata['last_name'];


        return json_encode(array("response_code" => 0, "response_message" => 'Check your mail'));
    }

    public function sackUser($data)
    {
        $username = $data['username'];
        // $status   = ($data['status'] == 1) ? "0" : "1";
        $status   = "1";
        $sql      = "UPDATE userdata SET reg_status = '$status' WHERE username = '$username' LIMIT 1";
        // file_put_contents('sack_user.txt', $sql);
        $cc = $this->db_query($sql, false);
        if ($cc) {
            return json_encode(array('response_code' => 0, 'response_message' => 'Action on user profile is now effective'));
        } else {
            return json_encode(array('response_code' => 432, 'response_message' => 'Action failed'));
        }
    }
    public function notifyChurchUsers($church_id, array $roles, $msg, $notification_type = "email")
    {
        $usersContact = array();
        if ($notification_type == "email") {
            foreach ($roles as $role_value) {
                $sql    = "SELECT email FROM userdata WHERE church_id = '$church_id' AND role_id = '$role_value' ";
                $result = $this->db_query($sql);
                //                $usersContact[] = $result[0]['email'];
                //                $msg    = "Good Day Sir/Madam,\n The Accountant has just posted a collection, and needs your approval.\n Kindly login to the portal to approve collection";
                mail($result[0]['email'], "The Lord's Chosen Charismatic Revival Church::Approval Notification ", $msg);
            }
        } elseif ($notification_type == "sms") {
        }
    }
    public function changeUserStatus($data)
    {
        $username = $data['username'];
        $status = ($data['current_status'] == 1) ? 0 : 1;
        $sql = "UPDATE userdata SET user_disabled = '$status' WHERE username = '$username'";
        $this->db_query($sql, false);
        return json_encode(array("response_code" => 0, "response_message" => "updated successfully"));
    }

    public function doForgotPasswordChange($data)
    {
        $validation = $this->validate(
            $data,
            array(
                'username' => 'required',
                'password' => 'required|min:6',
                'confirm_password' => 'required|matches:password'
            ),
            array('username' => 'Username', 'password' => 'Password', 'confirm_password' => 'Current Password')
        );

        if (!$validation['error']) {
            $username      = $data['username'];
            $user_password = $data['password'];
            $key            = $username;
            $desencrypt             = new DESEncryption();
            $cipher_password = $desencrypt->des($key, $user_password, 1, 0, null, null);
            $str_cipher_password = $desencrypt->stringToHex($cipher_password);
            $query_data = "UPDATE userdata set password='$str_cipher_password', passchg_logon = '0', user_locked = '0' where username= '$username'";
            //                    echo $query_data;
            $result_data = $this->db_query($query_data, false);
            if ($result_data > 0) {
                return json_encode(array('response_code' => 0, 'response_message' => 'Your password was changed successfully'));
            } else {
                return json_encode(array('response_code' => 45, 'response_message' => 'Your password was changed successfully'));
            }
        } else {
            return json_encode(array("response_code" => 20, "response_message" => $validation['messages'][0]));
        }
    }
    public function doPasswordChange($data)
    {
        $validation = $this->validate(
            $data,
            array(
                'username' => 'required',
                'current_password' => 'required',
                'password' => 'required|min:6',
                'confirm_password' => 'required|matches:password'
            ),
            array('confirm_password' => 'Confirm password', 'username' => 'Username', 'password' => 'User password', 'current_password' => 'Current Password')
        );
        if ($data['current_password'] == $data['password']) {
            $validation['error'] = true;
            $validation['messages'][0] = "Kindly choose a password that is different from your current one.";
        }
        if (!$validation['error']) {
            $username      = $data['username'];
            $user_password = $data['password'];
            $user_curr_password = $data['current_password'];

            $desencrypt = new DESEncryption();
            $key = $username;
            $cipher_password = $desencrypt->des($key, $user_curr_password, 1, 0, null, null);
            $str_cipher_password = $desencrypt->stringToHex($cipher_password);
            //                $str_cipher_password = $this->EncryptData($username,$user_password);
            $sql = "SELECT username FROM userdata WHERE username = '$username' AND password = '$str_cipher_password'";
            $rr  = $this->db_query($sql, false);
            if ($rr == 1) {

                $cipher_password = $desencrypt->des($key, $user_password, 1, 0, null, null);
                $str_cipher_password = $desencrypt->stringToHex($cipher_password);
                $query_data = "UPDATE userdata set password='$str_cipher_password', passchg_logon = '0' where username= '$username'";
                //                    echo $query_data;
                $result_data = $this->db_query($query_data, false);
                if ($result_data > 0) {
                    if ($data['page'] == 'first_login') {
                        return json_encode(array('response_code' => 0, 'response_message' => 'Your password was changed successfully... <a href="index.php">Proceed to login</a>'));
                    } else {
                        return json_encode(array('response_code' => 0, 'response_message' => 'Your password was changed successfully... logging you out'));
                    }
                } else {
                    return json_encode(array('response_code' => 45, 'response_message' => 'Your password could not be changed'));
                }
            } else {
                return json_encode(array('response_code' => 455, 'response_message' => 'current password is invalid'));
            }
        } else {
            return json_encode(array("response_code" => 20, "response_message" => $validation['messages'][0]));
        }
    }
    public function passwordHash($secret)
    {
        $hashvalue = password_hash($secret, PASSWORD_DEFAULT);
        return $hashvalue;
        //		echo "<br/>".password_verify($secret,'$2y$10$s4N.5vNNy5iniEQ2Pycn.uE.OJJ69p.1eT9W6JOce7j9TAgzjrxJS');
        //		var_dump( password_get_info('$2y$10$s4N.5vNNy5iniEQ2Pycn.uE.OJJ69p.1eT9W6JOce7j9TAgzjrxJS') );
    }
}
