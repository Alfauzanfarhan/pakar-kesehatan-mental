<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

include 'koneksi.php';

try {
    // Ambil gejala
    $gejalaResult = pg_query($conn, 'SELECT kode_gejala, nama_gejala, pertanyaan FROM gejala ORDER BY gejala_id');
    if (!$gejalaResult) {
        throw new Exception('Gagal mengambil data gejala');
    }
    $kodegejala = [];
    $gejala = [];
    $pertanyaan = [];
    while ($row = pg_fetch_assoc($gejalaResult)) {
        $kodegejala[] = $row['kode_gejala'];
        $gejala[] = $row['nama_gejala'];
        $pertanyaan[] = $row['pertanyaan'];
    }

    // Ambil penyakit
    $penyakitResult = pg_query($conn, 'SELECT kode_penyakit, nama_penyakit, description, saran_penanganan FROM penyakit ORDER BY penyakit_id');
    if (!$penyakitResult) {
        throw new Exception('Gagal mengambil data penyakit');
    }
    $kodepenyakit = [];
    $namaPenyakit = [];
    $deskripsi = [];
    $solusi = [];
    while ($row = pg_fetch_assoc($penyakitResult)) {
        $kodepenyakit[] = $row['kode_penyakit'];
        $namaPenyakit[] = $row['nama_penyakit'];
        $deskripsi[] = $row['description'];
        $solusi[] = $row['saran_penanganan'];
    }

    // Ambil bobot gejala
    $bobotResult = pg_query($conn, "
        SELECT penyakit_id, gejala_id, weight
        FROM bobot
        ORDER BY penyakit_id, gejala_id
    ");
    if (!$bobotResult) {
        throw new Exception('Gagal mengambil data bobot gejala');
    }

    // Format bobot gejala ke array 2D
    $penyakitCount = count($namaPenyakit);
    $gejalaCount = count($gejala);
    $bobotgejala = array_fill(0, $penyakitCount, array_fill(0, $gejalaCount, 0));
    while ($row = pg_fetch_assoc($bobotResult)) {
        $bobotgejala[$row['penyakit_id'] - 1][$row['gejala_id'] - 1] = (float)$row['weight'];
    }

    // Kirim response JSON
    echo json_encode([
        'gejala' => $gejala,
        'pertanyaan' => $pertanyaan,
        'bobotgejala' => $bobotgejala,
        'namaPenyakit' => $namaPenyakit,
        'deskripsi' => $deskripsi,
        'solusi' => $solusi
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Kesalahan server: ' . $e->getMessage()]);
}

pg_close($conn);
?>