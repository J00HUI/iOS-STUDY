<?php
    $conn = mysqli_connect('localhost', 'root', 'root', 'iphone');
    $message = "";
    $sql = "Select favoriteno, id, name, descript, imageName, date from iphone.favorite order my date asc";

    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0) {
        $resultArray = array();
        $tempArray = array();

        while($row = mysqli_fetch_object($result)){
            $tempArray = $row;
            array_push($resultArray, $tempArray);
        }

        echo json_encode($resultArray);
    } else {
        echo mysqli_error($conn);
    }
    mysqli_close($conn);
?>
