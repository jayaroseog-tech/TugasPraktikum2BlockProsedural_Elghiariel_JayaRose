# TugasPraktikum2BlockProsedural_Elghiariel_JayaRose
# 📘 README.md

## Sistem Akademik Mahasiswa Berbasis MySQL (Stored Procedure)

---

## 1. 📖 Deskripsi Proyek

Proyek ini merupakan implementasi sistem akademik sederhana menggunakan **MySQL** dengan pendekatan **Stored Procedure**. Sistem ini dirancang untuk mengelola dan memvalidasi data mahasiswa serta menentukan kelayakan pengambilan KRS berdasarkan data akademik.

---

## 2. 🎯 Tujuan

* Memahami penggunaan **Stored Procedure** di MySQL
* Mengimplementasikan logika **IF, CASE, dan JOIN**
* Melakukan validasi data akademik mahasiswa
* Menentukan kelayakan pengambilan KRS
* Membandingkan performa akademik mahasiswa

---

## 3. 🗄️ Struktur Database

### 3.1 Tabel `mahasiswa`

| Field    | Tipe Data   | Keterangan     |
| -------- | ----------- | -------------- |
| nim      | VARCHAR(20) | Primary Key    |
| nama     | VARCHAR(50) | Nama mahasiswa |
| semester | INT         | Semester aktif |
| prodi    | VARCHAR(50) | Program studi  |

---

### 3.2 Tabel `akademik`

| Field             | Tipe Data    | Keterangan          |
| ----------------- | ------------ | ------------------- |
| nim               | VARCHAR(20)  | Relasi ke mahasiswa |
| sks               | INT          | Jumlah SKS          |
| ipk               | DECIMAL(3,2) | Indeks Prestasi     |
| status_pembayaran | VARCHAR(10)  | LUNAS / BELUM       |

---

## 4. ⚙️ Stored Procedure

### 4.1 `identitas_mahasiswa()`

Menampilkan identitas mahasiswa dalam bentuk kalimat deskriptif lengkap.

---

### 4.2 `validasi_akademik()`

Melakukan validasi data berdasarkan:

* Status pembayaran
* Semester
* Jumlah SKS

**Output:**

* Status Data (Valid / Tidak Valid)
* Beban Studi (Ringan / Sedang / Padat)
* Performa Akademik (Cukup / Baik / Sangat Baik)

---

### 4.3 `bagianC_krs()`

Menentukan kelayakan mahasiswa dalam mengambil KRS.

**Kriteria:**

* Pembayaran harus **LUNAS**
* Semester > 0
* SKS > 0

---

### 4.4 `bagianD_krs()`

Membandingkan dua mahasiswa berdasarkan IPK dan memberikan kesimpulan:

* Lebih unggul
* Atau setara

---

## 5. ▶️ Cara Menjalankan

1. Jalankan seluruh script SQL secara berurutan:

   * DROP TABLE
   * CREATE TABLE
   * INSERT DATA
   * CREATE PROCEDURE

2. Eksekusi Stored Procedure:

```sql
CALL identitas_mahasiswa();
CALL validasi_akademik();
CALL bagianC_krs();
CALL bagianD_krs();
```

---

## 6. 🧪 Skenario Pengujian

### ✅ Skenario 1 (Data Valid)

* SKS = 16
* IPK = 3.20
* Status = LUNAS
  ✔ Hasil: **Layak mengambil KRS**

---

### ❌ Skenario 2 (Pembayaran Tidak Valid)

* Status = BELUM
  ✖ Hasil: **Tidak layak mengambil KRS**

---

### ❌ Skenario 3 (SKS Tidak Valid)

* SKS = 0
  ✖ Hasil: **Tidak layak mengambil KRS**

---

## 7. 📌 Catatan Penting

* Gunakan `DELIMITER //` saat membuat Stored Procedure
* Kembalikan delimiter ke `;` setelah selesai
* Pastikan tidak ada error saat JOIN antar tabel
* Gunakan `DROP PROCEDURE IF EXISTS` untuk menghindari konflik

---

## 8. 👨‍💻 Author

* Elghiariel Sima Tonga (IK2411035)
* Jaya Rose Bomba O.G (IK2411007)

Program Studi Informatika
Universitas Mega Buana Palopo

---

## 9. ✅ Kesimpulan

Sistem ini berhasil:

* Mengelola data mahasiswa dan akademik
* Melakukan validasi otomatis
* Menentukan kelayakan KRS
* Membandingkan performa mahasiswa
