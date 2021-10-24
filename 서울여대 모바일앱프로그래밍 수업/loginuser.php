<?php
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');

    header('Content-Type: charset=utf-8');

    $userid = ($_POST['id']);
    $password = ($_POST['password']);
    $password = md5($password);
    $name = ($_POST['name']);

    $sql = "insert into user (userid, passwd, name) values ('$userid', '$password', '$name')";

    if(mysqli_query($conn, $sql)){
        echo 'insert Done!!!';
    } else {
        echo mysqli_error($conn);
    }

    mysqli_close($conn);

?>
