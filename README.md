# TugasPraktikum2BlockProsedural_Elghiariel_JayaRose

📘 Sistem Akademik Mahasiswa Berbasis MySQL (Stored Procedure)

# Struktur Block Prosedural 

👤 Anggota Kelompok
– Elghiariel Sima TONGA NIM: IK2411035

–Jaya Rose Bomba O.G NIM: IK2411007

📖 Deskripsi Proyek
Proyek ini merupakan implementasi sistem akademik sederhana menggunakan MySQL dengan pendekatan Stored Procedure. Sistem ini dirancang untuk mengelola data mahasiswa, melakukan validasi akademik, serta menentukan kelayakan pengambilan KRS secara otomatis.

🎯 Tujuan
Proyek ini bertujuan untuk:
Memahami penggunaan Stored Procedure pada MySQL
Mengimplementasikan logika IF, CASE, dan JOIN
Melakukan validasi data akademik mahasiswa
Menentukan kelayakan pengambilan KRS
Membandingkan performa akademik antar mahasiswa

🗄️ Struktur Database
📌 Tabel mahasiswa
| Field    | Tipe Data   | Keterangan     |
| -------- | ----------- | -------------- |
| nim      | VARCHAR(20) | Primary Key    |
| nama     | VARCHAR(50) | Nama mahasiswa |
| semester | INT         | Semester aktif |
| prodi    | VARCHAR(50) | Program studi  |

📌 Tabel akademik
| Field             | Tipe Data    | Keterangan          |
| ----------------- | ------------ | ------------------- |
| nim               | VARCHAR(20)  | Relasi ke mahasiswa |
| sks               | INT          | Jumlah SKS          |
| ipk               | DECIMAL(3,2) | Indeks Prestasi     |
| status_pembayaran | VARCHAR(10)  | LUNAS / BELUM       |

⚙️ Stored Procedure
🔹 identitas_mahasiswa()
Menampilkan identitas mahasiswa dalam bentuk kalimat deskriptif.
🔹 validasi_akademik()
Melakukan validasi berdasarkan:
Status pembayaran
Semester
Jumlah SKS
Output:
Status Data (Valid / Tidak Valid)
Beban Studi (Ringan / Sedang / Padat)
Performa Akademik (Cukup / Baik / Sangat Baik)
🔹 bagianC_krs()
Menentukan kelayakan mahasiswa dalam mengambil KRS.
Kriteria:
Status pembayaran harus LUNAS
Semester > 0
SKS > 0
🔹 bagianD_krs()
Membandingkan dua mahasiswa berdasarkan IPK, dengan hasil:
Mahasiswa lebih unggul
Atau setara

▶️ Cara Menjalankan
Jalankan script SQL secara berurutan:
DROP TABLE
CREATE TABLE
INSERT DATA
CREATE PROCEDURE
Jalankan Stored Procedure berikut:
SQL
CALL identitas_mahasiswa();
CALL validasi_akademik();
CALL bagianC_krs();
CALL bagianD_krs();

🧪 Skenario Pengujian
✅ Skenario 1 – Data Valid
SKS = 16
IPK = 3.20
Status = LUNAS
✔ Hasil: Layak mengambil KRS
❌ Skenario 2 – Pembayaran Tidak Valid
Status = BELUM
✖ Hasil: Tidak layak mengambil KRS
❌ Skenario 3 – SKS Tidak Valid
SKS = 0
✖ Hasil: Tidak layak mengambil KRS
📌 Catatan Penting
Gunakan DELIMITER // saat membuat Stored Procedure
Kembalikan delimiter ke ; setelah selesai
Pastikan relasi JOIN antar tabel berjalan dengan benar
Gunakan DROP PROCEDURE IF EXISTS untuk menghindari error duplikasi

👨‍💻 Author
Elghiariel Sima Tonga (IK2411035)
Jaya Rose Bomba O.G (IK2411007)
Program Studi Informatika
Universitas Mega Buana Palopo

✅ Kesimpulan
Sistem ini berhasil:
Mengelola data mahasiswa dan akademik
Melakukan validasi otomatis
Menentukan kelayakan pengambilan KRS
Membandingkan performa mahasiswa
Kalau mau, aku juga bisa bantu:
�⁠bikin file SQL lengkap (tinggal import)
atau �⁠struktur folder GitHub biar kelihatan profesional (README + SQL + screenshot) 👍
