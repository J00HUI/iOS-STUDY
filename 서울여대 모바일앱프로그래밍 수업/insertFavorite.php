<?php
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');

    $id = ($_POST['id']);
    $name = ($_POST['name']);
    $description = ($_POST['descript']);
    $image = ($_POST['image']);
    $date = ($_POST['date']);

    $sql = "insert into iphone.Favorite (id, name, descript, imageName, date) values ('$id', '$name', '$description', '$imageName', '$date')";
    
    if(mysqli_query($conn, $sql)) {
        echo 'Insert Done!!';
    }
    else {
        echo mysqli_error($conn);
    }

    mysqli_close($conn);
?>
