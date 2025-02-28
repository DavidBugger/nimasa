<?php

class curlRequest extends dbobject
{
  public function registercurlRequest($data)
  {

    $curl = curl_init();

    $fullname = isset($data['fullname']) ? $data['fullname'] : "";
    $phone_number = isset($data['phone_number']) ? $data['phone_number'] : "";
    $email = isset($data['email']) ? $data['email'] : "";
    $gender = isset($data['gender']) ? $data['gender'] : "";
    $district = isset($data['district']) ? $data['district'] : "";
    $local_govt = isset($data['local_govt']) ? $data['local_govt'] : "";
    $operation = isset($data['operation']) ? $data['operation'] : "";
    $request_data = json_encode(array(
      "fullname" => $fullname,
      "gender" => $gender,
      "phone_number" => $phone_number,
      "email" => $email,
      "local_govt" => $local_govt,
      "district" => $district,
      "operation" => $operation
    ));

    curl_setopt_array($curl, array(
      CURLOPT_URL => 'http://localhost/thirdproject/demo/api/reg_member',
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => $request_data,
      CURLOPT_HTTPHEADER => array(
        'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Nzc1ODE5MTIsImV4cCI6MTY3NzY2ODMxMiwiaXNzIjoiIiwiZGF0YSI6eyJpZCI6bnVsbCwiZmlyc3RuYW1lIjpudWxsLCJsYXN0bmFtZSI6bnVsbCwiZW1haWwiOm51bGwsInJvbGVfaWQiOm51bGwsInN0YXRpb25fY29kZSI6bnVsbCwiY29tcGFueV9pZCI6bnVsbH19.CSUlIBuBGSg1nO0msM55WIrS8eIP_rngcpYGL-YvJt0',
        'Content-Type: application/json',
        'Cookie: PHPSESSID=nv7rlo4ejekrrtl966qjk76v0b'
      ),
    ));

    $response = curl_exec($curl);

    curl_close($curl);
    echo $response;
  }
}
