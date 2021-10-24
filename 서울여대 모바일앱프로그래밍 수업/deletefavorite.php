<?php
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');

    $no = ($_POST['favoriteno']);
    $sql = "delete from favorite where favoriteno='$no'";
    if(mysqli_query($conn, $sql)){
        echo 'Delete Done!!';
    } else {
        echo mysqli_error($conn);
    }

    mysqli_close($conn);
?>
