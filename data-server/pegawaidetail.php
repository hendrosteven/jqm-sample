<?php
header("Access-Control-Allow-Origin:*");
include 'config.php';

$sql = "select id,nama,jabatan,alamat,email,telp,img_url,lat,lon from tbl_pegawai where id=:id";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);
	$stmt->bindParam("id", $_GET[id]);
	$stmt->execute();
	$pegawai = $stmt->fetchObject();
	$dbh = null;
	echo '{"item":'. json_encode($pegawai) .'}';
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
}

?>
