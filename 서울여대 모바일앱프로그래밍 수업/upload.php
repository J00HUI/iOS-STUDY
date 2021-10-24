<?php
    $uploaddir = './'; //Uploading to same directory as PHP file
    // $_FILES['userfile']['name'] : 클라이언언트  머신에  존재하는  파일의  원래  이름 
    $file = basename($_FILES['userfile']['name']);
    // echo $file; --> .jpg
    $uploadFile = $file;
    $randomNumber = rand(0, 99999999);
    $newName = $uploadDir . $randomNumber . $uploadFile;
    // echo $newName; --> 12345678.jpg

    // $_FILES['userfile']['tmp_name']: 서버에 저장된 업로드된 파일의 임시 파일 이름
    if(is_uploaded_file($_FILES['userfile']['tmp_name'])) {
        if(move_uploaded_file($_FILES['userfile']['tmp_name'], $newName)) {
            echo $newName;
        }
    }
    else {
        echo "Temp file not uploaded. \r\n";
    }
?>
