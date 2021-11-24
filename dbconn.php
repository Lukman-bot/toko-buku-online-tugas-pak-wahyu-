<?php
$host       = "localhost";
$dbusername = "root";
$dbpassword = "";
$dbname     = "tugas_pakwahyu"; 

$link = mysqli_connect ($host, $dbusername, $dbpassword, $dbname);

if (mysqli_connect_error()) {
    echo "Koneksi ke server MySQL gagal";
    exit();
} else {
    // echo "Koneksi ke server MySQL sukses";
}
?>