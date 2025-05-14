<?php
include 'koneksi.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diagnosis Sistem Pakar Gangguan Kesehatan Mental</title>
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

        #diagnosis-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: var(--secondary-blue);
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: all 0.3s ease;
        }

        #diagnosis-container:hover {
            transform: translateY(-5px);
        }

        h2, h3 {
            color: var(--white);
            margin-bottom: 20px;
        }

        #question-text {
            font-size: 18px;
            margin-bottom: 25px;
            color: var(--white);
            font-weight: 500;
        }

        #question-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #question-form label {
            display: flex;
            align-items: center;
            margin: 5px 0;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 5px;
            border-radius: 8px;
            width: 50%;
            max-width: 400px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #question-form label:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        #question-form label input {
            margin-right: 15px;
        }

        #question-form button {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: var(--white);
            color: var(--secondary-blue);
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        #question-form button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        #result {
            margin-top: 20px;
            text-align: left;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
        }

        #result h3 {
            margin-bottom: 15px;
        }

        #result p {
            margin-bottom: 15px;
        }

        #result button {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: var(--white);
            color: var(--secondary-blue);
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        #result button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* Modal */
        .modal {
            display: none; /* Hidden secara default */
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.6); /* Background gelap */
        }

        /* Isi Modal */
        .modal-content {
            background-color: #ffffff;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            color: #0063c6; 
        }

        /* Tombol Modal */
        .modal-buttons button {
            margin: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        #confirmYes {
            background-color: #28a745;
            color: white;
        }

        #confirmNo {
            background-color: #dc3545;
            color: white;
        }

        #alertOk {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>

<body>
    <div id="diagnosis-container">
    <h2>Diagnosis Gejala</h2>
    <p style="font-weight: bold;" id="question-text"></p>

    <form id="question-form">
        <label><input type="radio" name="answer" value="0" required> Tidak</label>
        <label><input type="radio" name="answer" value="1"> Iya</label>
        <button type="button" onclick="nextQuestion()">Lanjut</button>
        <button type="button" onclick="backQuestion()">Kembali</button>
    </form>

    <!-- Modal Konfirmasi -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <p>Semua jawaban sudah tersimpan. Apakah Anda yakin ingin melihat hasil diagnosis?</p>
            <div class="modal-buttons">
                <button id="confirmYes">Ya</button>
                <button id="confirmNo">Batal</button>
            </div>
        </div>
    </div>  

    <!-- Modal Alert -->
    <div id="alertModal" class="modal">
        <div class="modal-content">
            <p id="alertMessage"></p>
            <div class="modal-buttons">
                <button id="alertOk">OK</button>
            </div>
        </div>
    </div>

    <div id="result" style="display:none;">
        <h3>Hasil Diagnosa</h3>
        <p id="result-text"></p>
    </div>
</div>

<script>
       let bobotgejala = [];
        let namaPenyakit = [];
        let deskripsi = [];
        let solusi = [];
        let currentQuestionIndex = 0;
        const inputUser = [];

        // Fungsi untuk mengambil data dari api.php
        async function fetchData() {
            try {
                const response = await fetch('./api.php');
                if (!response.ok) throw new Error('Gagal mengambil data dari server');
                const data = await response.json();
                if (data.error) throw new Error(data.error);

                gejala = data.gejala;
                pertanyaan = data.pertanyaan
                bobotgejala = data.bobotgejala;
                namaPenyakit = data.namaPenyakit;
                deskripsi = data.deskripsi;
                solusi = data.solusi;

                // Set pertanyaan pertama
                if (gejala.length > 0) {
                    document.getElementById('question-text').innerText = pertanyaan[0];
                } else {
                    showAlert('Tidak ada gejala yang tersedia.');
                }
            } catch (err) {
                console.error('Error fetching data:', err);
                showAlert('Gagal memuat data. Silakan coba lagi.');
            }
        }

        // Panggil fetchData saat halaman dimuat
        window.onload = fetchData;

        // Fungsi untuk menampilkan alert
        function showAlert(message) {
            document.getElementById('alertMessage').innerText = message;
            document.getElementById('alertModal').style.display = "block";
            document.getElementById('alertOk').onclick = function() {
                document.getElementById('alertModal').style.display = "none";
            };
        }

        // Fungsi untuk menangani tombol "Lanjut"
        function nextQuestion() {
            const selectedAnswer = document.querySelector('input[name="answer"]:checked');
            if (!selectedAnswer) {
                showAlert("Silakan pilih jawaban terlebih dahulu sebelum melanjutkan!");
                return;
            }

            inputUser[currentQuestionIndex] = parseFloat(selectedAnswer.value);
            document.querySelector('#question-form').reset();

            currentQuestionIndex++;
            if (currentQuestionIndex < gejala.length) {
                document.getElementById('question-text').innerText = pertanyaan[currentQuestionIndex];

                if (inputUser[currentQuestionIndex] !== undefined) {
                    const radioButtons = document.querySelectorAll('input[name="answer"]');
                    radioButtons.forEach(radio => {
                        if (radio.value == inputUser[currentQuestionIndex]) {
                            radio.checked = true;
                        }
                    });
                }
            } else {
                document.getElementById('confirmModal').style.display = "block";

                document.getElementById('confirmYes').onclick = function() {
                    document.getElementById('confirmModal').style.display = "none";
                    document.getElementById('diagnosis-container').style.display = "none";
                    hitungDiagnosis();
                };

                document.getElementById('confirmNo').onclick = function() {
                    document.getElementById('confirmModal').style.display = "none";
                    currentQuestionIndex--;
                    document.getElementById('question-text').innerText = pertanyaan[currentQuestionIndex];

                    if (inputUser[currentQuestionIndex] !== undefined) {
                        const radioButtons = document.querySelectorAll('input[name="answer"]');
                        radioButtons.forEach(radio => {
                            if (radio.value == inputUser[currentQuestionIndex]) {
                                radio.checked = true;
                            }
                        });
                    }
                };
            }
        }

        // Fungsi untuk menangani tombol "Kembali"
        function backQuestion() {
            if (currentQuestionIndex === 0) {
                showAlert("Ini adalah pertanyaan pertama, Anda tidak bisa kembali lebih jauh.");
                return;
            }

            currentQuestionIndex--;
            document.getElementById('question-text').innerText = pertanyaan[currentQuestionIndex];

            if (inputUser[currentQuestionIndex] !== undefined) {
                const radioButtons = document.querySelectorAll('input[name="answer"]');
                radioButtons.forEach(radio => {
                    if (radio.value == inputUser[currentQuestionIndex]) {
                        radio.checked = true;
                    }
                });
            } else {
                document.querySelector('#question-form').reset();
            }
        }

        // Fungsi untuk menghitung diagnosis menggunakan Teorema Bayes
        function hitungDiagnosis() {
            console.log('Bobot Gejala:', bobotgejala);
            console.log('Input User:', inputUser);

            const problikelihoodUser = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                problikelihoodUser[i] = [];
                for (let j = 0; j < gejala.length; j++) {
                    problikelihoodUser[i][j] = bobotgejala[i][j] * (inputUser[j] || 0);
                }
            }
            console.log('Prob Likelihood User:', problikelihoodUser);

            const sumprobLH = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                sumprobLH[i] = problikelihoodUser[i].reduce((sum, val) => sum + val, 0);
            }
            console.log('Sum Prob LH:', sumprobLH);

            const probnorm = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                probnorm[i] = [];
                for (let j = 0; j < gejala.length; j++) {
                    probnorm[i][j] = sumprobLH[i] !== 0 ? problikelihoodUser[i][j] / sumprobLH[i] : 0;
                }
            }
            console.log('Prob Norm:', probnorm);

            const probjoint = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                probjoint[i] = [];
                for (let j = 0; j < gejala.length; j++) {
                    probjoint[i][j] = problikelihoodUser[i][j] * probnorm[i][j];
                }
            }
            console.log('Prob Joint:', probjoint);

            const sumprobjoint = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                sumprobjoint[i] = probjoint[i].reduce((sum, val) => sum + val, 0);
            }
            console.log('Sum Prob Joint:', sumprobjoint);

            const probposterior = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                probposterior[i] = [];
                for (let j = 0; j < gejala.length; j++) {
                    probposterior[i][j] = sumprobjoint[i] !== 0
                        ? ((bobotgejala[i][j] * (inputUser[j] || 0)) * probjoint[i][j]) / sumprobjoint[i]
                        : 0;
                }
            }
            console.log('Prob Posterior:', probposterior);

            const bayes = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                bayes[i] = [];
                for (let j = 0; j < gejala.length; j++) {
                    bayes[i][j] = problikelihoodUser[i][j] * probposterior[i][j];
                }
            }
            console.log('Bayes:', bayes);

            const sumbayes = [];
            for (let i = 0; i < namaPenyakit.length; i++) {
                sumbayes[i] = bayes[i].reduce((sum, val) => sum + val, 0);
            }
            console.log('Sum Bayes:', sumbayes);

            const maxbayes = Math.max(...sumbayes);
            const indexMax = sumbayes.indexOf(maxbayes);

            console.log('Max Bayes:', maxbayes);
            console.log('Index Max:', indexMax);

            let cek = inputUser.reduce((count, val) => count + (val === 0 ? 1 : 0), 0);
            console.log('Cek:', cek);

            document.getElementById('diagnosis-container').style.display = "block";
            if (cek === gejala.length) {
                document.getElementById('diagnosis-container').innerHTML = `
                    <h2>Hasil Diagnosa</h2>
                    <div id="result">
                        <h3><strong>Sehat Kamu</strong></h3>
                        <p></p>
                        <a href="index.php"><button>Kembali ke Menu Awal</button></a>
                    </div>
                `;
            } else {
                document.getElementById('diagnosis-container').innerHTML = `
                    <h2>Hasil Diagnosa</h2>
                    <div id="result">
                        <h3>Penyakit: <strong>${namaPenyakit[indexMax]}</strong></h3>
                        <p><strong>Deskripsi:</strong> ${deskripsi[indexMax]}</p>
                        <p><strong>Tingkat Kepastian:</strong> ${(maxbayes * 100).toFixed(2)}%</p>
                        <p><strong>Penanganan:</strong> ${solusi[indexMax]}</p>
                        <a href="index.php"><button>Kembali ke Menu Awal</button></a>
                    </div>
                `;
            }
        } 

</script>
</body>
</html>