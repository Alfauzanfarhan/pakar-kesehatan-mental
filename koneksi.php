<?php
$host = "localhost";
$port = "5432";
$dbname = "SP_KesehatanMental";
$user = "postgres"; // Ganti dengan pengguna Anda
$password = "Alf4uz@n"; // Ganti dengan kata sandi Anda

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");
if (!$conn) {
    die("Koneksi gagal!");
}
?>