<?php
ini_set('max_execution_time', 0);
require('desencrypt.php');
require("dataconnect.php"); 
$row = 1;
$desencrypt = new DESEncryption();

$fileName = "cards/PROMO_2024_Public.csv";
$cardAmount = 3000;
//$cardAmount = 2000;
$schSession = '2023/2024';
//$examType = 'MOCK-SSCE';
$examType = 'PROM';
//$examType = 'BECE';
//$examType = 'BECE';

$query_data = "INSERT into result_pin (pin_no,serial_no,academic_year,status,used_by,exam_type,usagee,last_usage,usage_history,amount)  values".' ';
if (($handle = fopen($fileName, "r")) !== FALSE) {
	$counter =  0;
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
		$pinarray[] = $data;
    }
    fclose($handle);
}
$k =0;
$limit =1000;
$counter =0;
$j =0;
	for($i=$k;$i<count($pinarray);$i++)
	{
		$counter +=1;
		$dat = $pinarray[$i];
        $num = count($dat);
        //echo "<p> $num fields in line $row: <br /></p>\n";
        $row++;
        for ($c=0; $c < $num; $c++)
		{
			if($c==1)
			{
				$pin = $desencrypt->des($dat[0], $dat[1], 1, 0, null,null);
				$str_cipher_pin = $desencrypt->stringToHex ($pin);
				//$pin2 = $desencrypt->hexToString($str_cipher_pin);
				$recover = trim($desencrypt->des($data[0], $pin2, 0, 0, null,null));
			}
            //echo $dat[$c]." ";
        }
		$query_data .= "('$str_cipher_pin','$dat[0]','$schSession','0','','$examType','0','','','$cardAmount')".',';
		// to execute query
		if($counter==500 || $counter>0)
		{
			$counttee  += $counter;
			$query = rtrim($query_data,',');
			$query .= ";";
			$real_query .=" ".$query;
			$result = mysql_query($query);
			if(mysql_error())
			{
				echo mysql_error();
			}
			$counter = 0;
			$query_data = "insert into result_pin (pin_no,serial_no,academic_year,status,used_by,exam_type,usagee,last_usage,usage_history,amount)  values".' ';
		}
		
	}
	
	echo $counttee.' pins Uploaded';