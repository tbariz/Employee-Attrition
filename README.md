# 🧑‍💼 Employee Attrition Analysis

**Analisis faktor penyebab karyawan resign (attrition) menggunakan SQL & Tableau**

---

## 📌 Latar Belakang

Perusahaan mengalami peningkatan tingkat attrition karyawan dari **14% menjadi 25%** dalam satu tahun terakhir.  
Proyek ini bertujuan untuk mengidentifikasi pola dan faktor utama yang menyebabkan attrition, serta memberikan rekomendasi bisnis berbasis data.

---

## 🎯 Problem Statement

> Terjadi peningkatan attrition karyawan dalam satu tahun terakhir dari 14% menjadi 25%, sehingga perlu dianalisis pola apa saja yang menjadi penyebab terbesar dari attrition.

---

## 📊 Tujuan Analisis

1. Mengidentifikasi dan menentukan peringkat faktor yang memiliki korelasi tertinggi dengan attrition.
2. Mengetahui profil karyawan dengan attrition tertinggi.
3. Membandingkan karakteristik karyawan dengan attrition tertinggi vs terendah untuk menemukan faktor protektif.
4. Memberikan rekomendasi berbasis data untuk menekan attrition rate, dengan prioritas pada faktor paling berdampak.

---

## 🛠️ Tools yang Digunakan

- **MySQL** – Data cleaning, eksplorasi data, dan analisis
- **GitHub** – Dokumentasi portofolio

---

## 📁 Dataset

Dataset berisi **1.470 karyawan** dengan **13 kolom**:

| Kolom | Deskripsi |
|-------|------------|
| Age | Usia karyawan |
| Department | Departemen (Sales, HR, RnD) |
| DistanceFromHome | Jarak rumah ke kantor |
| Education | Tingkat pendidikan (1–5) |
| EducationField | Bidang pendidikan |
| EnvironmentSatisfaction | Kepuasan lingkungan kerja (1–4) |
| JobSatisfaction | Kepuasan kerja (1–4) |
| MaritalStatus | Status pernikahan |
| MonthlyIncome | Gaji bulanan |
| NumCompaniesWorked | Jumlah perusahaan tempat bekerja sebelumnya |
| WorkLifeBalance | Work life balance (1–4) |
| YearsAtCompany | Lama bekerja di perusahaan ini |
| Attrition | Status resign (Yes/No) |

---

## 🔍 Insight Utama

### A. Pola Paling Jelas Penyebab Attrition

- Karyawan **usia muda (18–25 tahun)** memiliki attrition tertinggi (**35,77%**)
- Karyawan dengan **masa kerja kurang dari 1 tahun** memiliki attrition tertinggi (**34,88%**)
- **Gaji rendah (≤3k)** berkorelasi kuat dengan attrition (**28,61%**)
- Semakin tinggi **Job Satisfaction** dan **Work Life Balance**, semakin rendah attrition (meskipun ada sedikit anomali)

### B. Faktor Paling Berpengaruh (berdasarkan selisih attrition rate antar kategori)

| Faktor | Range | Pengaruh |
|--------|-------|----------|
| Usia (Age) | 26,58% | 🔴 Sangat besar |
| Masa kerja (YearsAtCompany) | 24,07% | 🔴 Sangat besar |
| Gaji (MonthlyIncome) | 19,71% | 🔴 Besar |
| Work Life Balance | 17,03% | 🟡 Sedang |
| Riwayat pindah (NumCompaniesWorked) | 15,34% | 🟡 Sedang |
| Job Satisfaction | 11,51% | 🟡 Sedang |
| Departemen | 6,79% | 🟢 Kecil |

### C. Hal Menarik dari Analisis

- **WLB skor 4** (sangat baik) memiliki attrition rate **lebih tinggi (17,65%)** dibanding skor 3 (14,22%)
- Karyawan dengan **riwayat pindah 1 kali** (NumCompanies=1) memiliki attrition cukup tinggi (18,81%), tetapi yang sudah pindah **8 kali** justru rendah (12,24%)
- **Sales vs RnD**: rata-rata Job Satisfaction dan WLB hampir sama, tetapi attrition rate Sales (**20,63%**) jauh lebih tinggi dibanding RnD (**13,84%**)

---

## 💡 Rekomendasi Bisnis

### 1. Fokus retensi pada karyawan baru (masa kerja < 1 tahun)
- **Insight:** Attrition rate 34,88%  
- **Rekomendasi:** Program onboarding, mentoring, check-in berkala 6 bulan pertama

### 2. Evaluasi kompensasi, terutama gaji rendah (≤3k)
- **Insight:** Attrition rate 28,61%  
- **Rekomendasi:** Tinjau ulang penyesuaian gaji dan kompensasi

### 3. Perhatikan karyawan muda (usia 18–25 tahun)
- **Insight:** Attrition rate 35,77%  
- **Rekomendasi:** Jalur karir jelas, program pengembangan diri, promosi

### 4. Investigasi lebih dalam ke tim Sales
- **Insight:** JS & WLB Sales mirip RnD, tapi attrition rate beda jauh  
- **Rekomendasi:** Audit target, tekanan kerja, sistem kompensasi; wawancara exit mendalam

### 5. Waspadai karyawan dengan riwayat sering pindah kerja (≥5)
- **Insight:** Attrition rate >22%  
- **Rekomendasi:** Wawancara mendalam saat rekrutmen terkait alasan pindah

---

## 📊 Dashboard

> 🚧 *Link Tableau Public akan ditambahkan setelah dashboard selesai*

Dashboard akan menampilkan:
- Total karyawan & attrition rate
- Attrition by department
- Attrition by job satisfaction
- Attrition by age group

---

## 📂 File dalam Proyek Ini

- `Employee_Attrition_Rate_Project.sql` – Semua query SQL (data cleaning, EDA, insight)
- `Attrition_Data.csv` – Dataset asli
- `README.md` – Dokumentasi proyek ini

---

## 👤 Tentang Proyek Ini

Proyek ini dibuat untuk keperluan **portofolio data analyst**.  
Fokus utama: **SQL (data cleaning & EDA)**.

Dibuat oleh: [Namamu]  
GitHub: [link GitHub kamu]
