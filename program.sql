-- =========================
-- 1. HAPUS TABEL (BIAR AMAN)
-- =========================
DROP TABLE IF EXISTS akademik;
DROP TABLE IF EXISTS mahasiswa;

-- =========================
-- 2. BUAT TABEL
-- =========================
CREATE TABLE mahasiswa (
    nim VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(50),
    semester INT,
    prodi VARCHAR(50)
);

CREATE TABLE akademik (
    nim VARCHAR(20),
    sks INT,
    ipk DECIMAL(3,2),
    status_pembayaran VARCHAR(10)
);

-- =========================
-- 3. INSERT DATA
-- =========================
INSERT INTO mahasiswa VALUES
('IK2411035','Elghiariel Sima Tonga',4,'Informatika'),
('IK2411007','Ros Bomba O.G',4,'Informatika');

INSERT INTO akademik VALUES
('IK2411035',16,3.20,'LUNAS'),
('IK2411007',20,3.60,'LUNAS');

-- =========================
-- 4. PROCEDURE A
-- =========================
DROP PROCEDURE IF EXISTS identitas_mahasiswa;
DELIMITER //

CREATE PROCEDURE identitas_mahasiswa()
BEGIN
    DECLARE kampus VARCHAR(100) DEFAULT 'Universitas Mega Buana Palopo';

    SELECT CONCAT(
        'Mahasiswa ', nama, ' (', nim, ') dari Program Studi ', prodi,
        ' terdaftar di ', kampus, ' pada semester ', semester, '.'
    ) AS identitas
    FROM mahasiswa;

END //

DELIMITER ;

-- =========================
-- 5. PROCEDURE B
-- =========================
DROP PROCEDURE IF EXISTS validasi_akademik;
DELIMITER //

CREATE PROCEDURE validasi_akademik()
BEGIN
    SELECT 
        CONCAT('Status data: ',
            IF(a.status_pembayaran='LUNAS' AND m.semester>0 AND a.sks>0,
               'Valid','Tidak Valid')
        ) AS status_data,

        CONCAT('Beban studi: ',
            CASE 
                WHEN a.sks BETWEEN 1 AND 12 THEN 'Ringan'
                WHEN a.sks BETWEEN 13 AND 18 THEN 'Sedang'
                ELSE 'Padat'
            END
        ) AS beban_studi,

        CONCAT('Performa akademik: ',
            CASE 
                WHEN a.ipk >= 3.50 THEN 'Sangat Baik'
                WHEN a.ipk >= 3.00 THEN 'Baik'
                ELSE 'Cukup'
            END
        ) AS performa

    FROM mahasiswa m
    JOIN akademik a ON m.nim = a.nim;

END //

DELIMITER ;

-- =========================
-- 6. PROCEDURE C
-- =========================
DROP PROCEDURE IF EXISTS bagianC_krs;
DELIMITER //

CREATE PROCEDURE bagianC_krs()
BEGIN
    SELECT CONCAT(
        'Mahasiswa ', m.nama, ' dengan NIM ', m.nim,
        ' dinyatakan ',
        IF(a.status_pembayaran='LUNAS' AND m.semester>0 AND a.sks>0,
           'layak mengambil KRS',
           'tidak layak mengambil KRS')
    ) AS hasil
    FROM mahasiswa m
    JOIN akademik a ON m.nim = a.nim;

END //

DELIMITER ;

-- =========================
-- 7. PROCEDURE D
-- =========================
DROP PROCEDURE IF EXISTS bagianD_krs;
DELIMITER //

CREATE PROCEDURE bagianD_krs()
BEGIN
    SELECT 
        m1.nama AS nama1,
        m2.nama AS nama2,
        a1.ipk,
        a2.ipk,

        CASE 
            WHEN a1.ipk > a2.ipk THEN 
                CONCAT(m1.nama, ' lebih unggul dari ', m2.nama)
            WHEN a2.ipk > a1.ipk THEN 
                CONCAT(m2.nama, ' lebih unggul dari ', m1.nama)
            ELSE 
                'Keduanya setara'
        END AS kesimpulan

    FROM mahasiswa m1
    JOIN akademik a1 ON m1.nim = a1.nim
    JOIN mahasiswa m2
    JOIN akademik a2 ON m2.nim = a2.nim

    WHERE m1.nim = 'IK2411035'
      AND m2.nim = 'IK2411007';

END //

DELIMITER ;

-- =========================
-- 8. MENJALANKAN SEMUA BAGIAN
-- =========================
CALL identitas_mahasiswa();
CALL validasi_akademik();
CALL bagianC_krs();
CALL bagianD_krs();

-- =========================
-- 9. SKENARIO PENGUJIAN (BAGIAN H)
-- =========================

-- ✅ Skenario 1: VALID
UPDATE akademik 
SET sks = 16, ipk = 3.20, status_pembayaran = 'LUNAS'
WHERE nim = 'IK2411035';

CALL bagianC_krs();


-- ❌ Skenario 2: TIDAK VALID (PEMBAYARAN)
UPDATE akademik 
SET status_pembayaran = 'BELUM'
WHERE nim = 'IK2411035';

CALL bagianC_krs();


-- ❌ Skenario 3: TIDAK VALID (SKS)
UPDATE akademik 
SET sks = 0, status_pembayaran = 'LUNAS'
WHERE nim = 'IK2411035';

CALL bagianC_krs();