<?php
include 'koneksi.php';
$query = 'SELECT * FROM Penyakit ORDER BY penyakit_id ASC';
$result = pg_query($conn, $query);
?>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Pakar Diagnosis Ginjal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-blue: #4467e3;
            --secondary-blue: #33478b;
            --light-blue: #6680ec;
            --white: #ffffff;
            --gray: #f4f4f4;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--primary-blue);
            color: var(--white);
            line-height: 1.6;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 50px;
            background-color: var(--secondary-blue);
            position: fixed;
            width: 100%;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .navbar .logo {
            font-size: 28px;
            font-weight: bold;
            color: var(--white);
            letter-spacing: -1px;
        }

        .nav-links {
            display: flex;
            gap: 30px;
            list-style: none;
        }

        .nav-links li a {
            text-decoration: none;
            color: var(--white);
            font-size: 16px;
            font-weight: 600;
            transition: color 0.3s ease;
            position: relative;
        }

        .nav-links li a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--white);
            transition: width 0.3s ease;
        }

        .nav-links li a:hover::after {
            width: 100%;
        }

        .hero-section {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 0 50px;
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
        }

        .info-section {
            background-color: var(--white);
            color: #333;
            padding: 100px 50px;
            border-radius: 20px 20px 0 0;
        }

        .content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .text {
            flex: 1;
            padding-right: 50px;
        }

        .text h1 {
            font-size: 52px;
            margin-bottom: 20px;
            color: var(--white);
            line-height: 1.2;
        }

        .text p {
            font-size: 18px;
            margin-bottom: 30px;
            max-width: 500px;
            color: rgba(255,255,255,0.9);
        }

        .cta-btn {
            padding: 12px 25px;
            background: var(--white);
            color: var(--secondary-blue);
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .cta-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0,0,0,0.15);
        }

        .image {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .image img {
            width: 500px;
            max-width: 100%;
            height: auto;
            border-radius: 15px;
        }

        .section-content {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .disease-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 40px;
        }

        .disease-card {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .disease-card:hover {
            transform: translateY(-5px);
        }

        #tentangkami {
            background-color: var(--light-blue);
            color: var(--white);
            padding: 100px 50px;
        }

        .section-spacer {
            height: 80px;
        }
    </style>
</head>
<body>
    <header class="navbar">
        <div class="logo">FlorAI.</div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.php">Beranda</a></li>
                <li><a href="#informasi">Informasi Penyakit</a></li>
                <li><a href="#tentangkami">Tentang Kami</a></li>
            </ul>
        </nav>
    </header>

    <div class="section-spacer"></div>

    <section id="home" class="hero-section">
        <div class="content">
            <div class="text">
                <h1>Sistem Pakar</h1>
                <p>Diagnosis Gangguan Kesehatan Mental pada Remaja Menggunakan Metode Forward Chaining dan Teorema Bayes</p>
                <a href="diagnosis.php"><button class="cta-btn">Mulai Diagnosis</button></a>
            </div>
            <div class="image">
                <img src="gambar1.png" alt="Gambar Printer">
            </div>
        </div>
    </section>

    <section id="informasi" class="info-section">
        <div class="section-content">
            <h2 style="color: var(--secondary-blue); margin-bottom: 30px;">Informasi Kesehatan Mental</h2>
            <p style="color: #333; max-width: 700px; margin: 0 auto 40px;">
                Kesehatan mental merupakan suatu kondisi kesejahteraan emosional, psikologis, dan sosial
                yang memungkinkan individu untuk menghadapi stres kehidupan, bekerja secara produktif, dan 
                berkontribusi dalam komunitasnya (WHO, 2023). Menurut Panggalo et al. (2024), kesehatan mental bukan hanya 
                tentang ketiadaan gangguan mental, tetapi juga mencakup aspek psikologis yang mendukung kesejahteraan 
                individu secara keseluruhan.
            </p>
            <p style="color: #333; max-width: 700px; margin: 0 auto 40px;">
                Penting bagi setiap individu untuk menjaga kesehatan mental sebagaimana menjaga kesehatan fisik. Kesadaran akan pentingnya 
                kesehatan mental harus ditanamkan sejak dini, mengingat gangguan mental sering kali berkembang secara perlahan dan tidak disadari. 
                Deteksi dan diagnosis dini menjadi langkah krusial untuk mencegah kondisi yang lebih serius dan mempercepat proses pemulihan. 
                Melalui website sistem pakar gangguan kesehatan mental ini, pengguna dapat melakukan pemeriksaan awal secara mandiri sehingga 
                dapat segera mengambil langkah tepat, baik berupa konsultasi dengan tenaga profesional maupun perubahan gaya hidup yang lebih sehat.
            </p>

        <div class="disease-info">
    <?php while ($row = pg_fetch_assoc($result)) { ?>
        <div class="disease-card" style="grid-column: 1 / -1; max-width: 600px; margin: 20px auto;">
            <h3 style="color: var(--secondary-blue); margin-bottom: 10px;">
                <?php echo htmlspecialchars($row['nama_penyakit']); ?>
            </h3>
            <p><?php echo htmlspecialchars($row['description']); ?></p>
        </div>
    <?php } ?>
        </div>
    </section>

    <section id="tentangkami">
        <div class="section-content">
            <h2 style="margin-bottom: 30px;">Tentang Sistem Pakar</h2>
            <p style="font-size: 18px; max-width: 700px; margin: 0 auto 40px;">
                Sistem Pakar ini dirancang untuk membantu pengguna mendiagnosis kemungkinan gangguan kesehatan mental 
                berdasarkan gejala yang mereka alami. Sistem menggunakan metode <em>teorema bayes</em> 
                untuk memberikan tingkat kepastian terhadap diagnosis yang dihasilkan.
            </p>
            <p style="font-weight: bold; font-style: italic;">
                Dibuat oleh Kelompok 6 : .....
            </p>
        </div>
    </section>
</body>
</html>
