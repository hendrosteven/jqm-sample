<?php

header("Access-Control-Allow-Origin: *");
include 'config.php';

$sql = "update tbl_pegawai set nama=?,alamat=?,jabatan=?,alamat=?,email=?,telp=?,
    img_url=?,lat=?,lon=? where id=?";

$id = $_REQUEST['id'];
$nama = $_REQUEST['nama'];
$jabatan = $_REQUEST['jabatan'];
$alamat = $_REQUEST['alamat'];
$email = $_REQUEST['email'];
$telp = $_REQUEST['telp'];
$img = $_REQUEST['img'];
$lat = 0;
$lon = 0;

try {
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
    $stmt = $dbh->prepare($sql);
    $stmt->execute(array($nama,$alamat,$jabatan,$alamat,$email,$telp,$img,$lat,$lon,$id));
    $dbh = null;
    echo "{'item':$id}";
} catch (PDOException $e) {
    echo '{"error":{"text":' . $e->getMessage() . '}}';
}
?>
