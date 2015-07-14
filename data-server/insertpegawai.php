<?php

header("Access-Control-Allow-Origin: *");
include 'config.php';

$sql = "insert into tbl_pegawai(nama,jabatan,alamat,email,telp,img_url,lat,lon)
        values(:nama,:jabatan,:alamat,:email,:telp,:img,:lat,:lon)";

$nama = $_REQUEST['nama'];
$jabatan = $_REQUEST['jabatan'];
$alamat = $_REQUEST['alamat'];
$email = $_REQUEST['email'];
$telp = $_REQUEST['telp'];
$img = "http://10.17.21.88/directory/data/pictures/" . $_REQUEST['img'].".jpg";
$lat = 0;
$lon = 0;

try {
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $dbh->prepare($sql);
    $stmt->bindParam("nama", $nama);
    $stmt->bindParam("jabatan", $jabatan);
    $stmt->bindParam("alamat", $alamat);
    $stmt->bindParam("email", $email);
    $stmt->bindParam("telp", $telp);
    $stmt->bindParam("img", $img);
    $stmt->bindParam("lat", $lat);
    $stmt->bindParam("lon", $lon);
    $stmt->execute();
    $dbh = null;
    echo "{'item':true}";
} catch (PDOException $e) {
    echo '{"error":{"text":' . $e->getMessage() . '}}';
}
?>
