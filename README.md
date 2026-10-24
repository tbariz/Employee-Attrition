# 📊 Employee Attrition Analysis

Analisis komprehensif terhadap data **Employee Attrition (IBM HR Analytics)** untuk mengidentifikasi faktor-faktor yang paling berpengaruh terhadap keputusan karyawan untuk resign, serta merumuskan rekomendasi retensi yang **actionable** dan **berbasis data**.

---

## 📌 Latar Belakang

Attrition (perputaran karyawan) merupakan salah satu tantangan terbesar di bidang HR. Biaya rekrutmen, pelatihan, dan kehilangan produktivitas akibat resign-nya karyawan dapat mencapai **1.5–2x gaji tahunan** per karyawan. 

Analisis ini bertujuan menjawab pertanyaan bisnis:

> **"Faktor apa yang paling berpengaruh terhadap attrition, dan apa rekomendasi yang bisa dilakukan untuk menekannya?"**

---

## 🎯 Tujuan Analisis

1. Mengidentifikasi **faktor-faktor** yang memiliki hubungan signifikan dengan attrition
2. Mengukur **kekuatan hubungan** masing-masing faktor
3. Merumuskan **rekomendasi retensi** yang spesifik dan berbasis data
4. Memvalidasi temuan dengan **uji statistik** (Chi-Square & Mann-Whitney)

---

## 📁 Dataset

- **Sumber:** IBM HR Analytics Employee Attrition & Performance
- **Jumlah baris:** 1.470 karyawan
- **Jumlah kolom original:** 13 fitur
- **Target variable:** `Attrition` (Yes/No)

**Fitur original:**
`Age`, `Attrition`, `Department`, `DistanceFromHome`, `Education`, `EducationField`, `EnvironmentSatisfaction`, `JobSatisfaction`, `MaritalStatus`, `MonthlyIncome`, `NumCompaniesWorked`, `WorkLifeBalance`, `YearsAtCompany`

---

## 🔧 Proses Analisis

### 1. Data Cleaning
- Pengecekan **missing values** → tidak ditemukan
- Pengecekan **duplikat** → tidak ditemukan
- Pengecekan **nilai unik & anomali** per kolom → data bersih

### 2. Feature Engineering
Membuat **6 fitur baru** untuk memperkaya analisis:

| Fitur Baru | Kategori | Deskripsi |
|------------|----------|-----------|
| `age_group` | Binning | Kelompok usia (18-25, 26-35, 36-45, 46-60) |
| `tenure_group` | Binning | Kelompok masa kerja (<1, 1-3, 3-5, 5-10, 10+ tahun) |
| `income_group` | Binning | Kuartil gaji (Q1-Q4) |
| `distance_group` | Binning | Jarak rumah (Near <5 km, Medium 5-15 km, Far >15 km) |
| `is_old_but_new` | Interaction | Usia >40 tahun **dan** masa kerja ≤2 tahun |
| `is_underpaid_experienced` | Interaction | Pengalaman ≥5 perusahaan **dan** gaji Q1 (terendah) |

### 3. Exploratory Data Analysis (EDA)
- **Demografi:** Age, Marital Status, Department, Education, Education Field, Distance from Home
- **Keseimbangan Pekerjaan:** Job Satisfaction, Environment Satisfaction, Work Life Balance
- **Kompensasi & Pengalaman:** Monthly Income, Num Companies Worked, Years at Company
- **Analisis kombinasi:** Heatmap attrition per kombinasi fitur (misal: Job Satisfaction × Department)

### 4. Analisis Deskriptif
- Statistik ringkasan (mean, median, std, skewness, kurtosis)
- Baseline attrition rate: **16,1%** (237 dari 1.470 karyawan)
- Ringkasan per kelompok (Department, Age Group, Income Group, dll)

### 5. Inferential Test
Validasi statistik untuk memastikan temuan **signifikan** dan **bukan kebetulan sampel**.

#### Chi-Square Test (Variabel Kategorik)

| Variabel | χ² | p-value | Signifikan? |
|----------|-----|---------|-------------|
| **Tenure Group** | **75.59** | <0.0001 | ✅ Ya |
| **Income Group** | **65.49** | <0.0001 | ✅ Ya |
| **Age Group** | **58.56** | <0.0001 | ✅ Ya |
| **Marital Status** | **46.16** | <0.0001 | ✅ Ya |
| Environment Satisfaction | 22.50 | <0.0001 | ✅ Ya |
| Job Satisfaction | 17.51 | 0.0006 | ✅ Ya |
| Work Life Balance | 16.33 | 0.0010 | ✅ Ya |
| Department | 10.80 | 0.0045 | ✅ Ya |

**Semua variabel kategorik signifikan (p < 0.05).**

#### Mann-Whitney U Test (Variabel Numerik)

| Variabel | Median (Resign) | Median (Bertahan) | p-value | Signifikan? |
|----------|-----------------|-------------------|---------|-------------|
| Age | 32 | 36 | <0.0001 | ✅ Ya |
| MonthlyIncome | Rp 3.202 | Rp 5.204 | <0.0001 | ✅ Ya |
| DistanceFromHome | 9 km | 7 km | 0.0024 | ✅ Ya |
| **NumCompaniesWorked** | 1 | 2 | 0.2424 | ❌ **Tidak** |

> **Catatan:** `NumCompaniesWorked` **TIDAK signifikan** — meskipun EDA menunjukkan pola, secara statistik perbedaan ini tidak bisa digeneralisasi. Ini menegaskan pentingnya validasi statistik.

---

## 💡 Insight Utama

### 📌 Insight 1: Masa Kerja = Faktor Terkuat
Karyawan dengan masa kerja **<1 tahun** memiliki attrition **34,9%** — hampir **3x lipat** dibanding 3-5 tahun (13,1%) dan 10+ tahun (8,1%). 
**Implikasi:** Risiko resign paling tinggi terjadi di **tahun pertama kerja**.

### 📌 Insight 2: Gaji Rendah = Risiko 2-3x Lipat
Karyawan dengan gaji **Q1 (terendah)** memiliki attrition **29,3%** — hampir **2x lipat** Q2 (14,2%) dan **3x lipat** Q3-Q4 (±10%). 
**Selisih median gaji:** Rp 3.202 (resign) vs Rp 5.204 (bertahan) — **±Rp 2 juta**.

### 📌 Insight 3: Karyawan Muda Resign Bukan Karena Kepuasan
Usia **18-25** memiliki attrition **35,8%** — tertinggi. Dari heatmap EDA, kelompok ini menunjukkan attrition **tinggi di SEMUA level kepuasan** (Job, Environment, WLB) — **berbeda** dengan usia 26+ yang attrition-nya turun seiring naiknya kepuasan. 
**Implikasi:** Untuk anak muda, **meningkatkan kepuasan kerja saja tidak cukup.**

### 📌 Insight 4: Karyawan Single Paling Berisiko
Single: **25,5%** — **2x lipat** married (12,5%) dan **2,5x lipat** divorced (10,1%). 
**Hipotesis:** Karyawan single lebih fleksibel pindah kerja (tanpa tanggungan keluarga).

### 📌 Insight 5: Jarak Rumah Berpengaruh Signifikan
Median jarak yang resign **9 km** vs bertahan **7 km** (p=0.0024). 
**Implikasi:** *Commuting fatigue* berpengaruh terhadap keputusan resign.

### 📌 Insight 6: Jumlah Perusahaan Sebelumnya TIDAK Signifikan
`NumCompaniesWorked` p=0.2424 → **TIDAK signifikan.** 
**Pelajaran:** Pola di EDA belum tentu signifikan secara statistik. Validasi statistik itu **wajib**.

### 📌 Insight 7: Department Paling Lemah
Department: χ²=10.80 (paling lemah). Sales tertinggi (20,6%) dan R&D terendah (13,8%), tapi perbedaan ini kemungkinan disebabkan oleh **komposisi karyawan** (lebih banyak usia muda & gaji rendah di Sales), bukan faktor "departemen" itu sendiri.

---

## 🎯 Rekomendasi

| Prioritas | Rekomendasi | Target | Dasar |
|-----------|-------------|--------|-------|
| **1** | **Program Retensi Karyawan Baru (<1 Tahun):** onboarding lebih kuat, mentoring, check-in rutin 3-6 bulan | Turunkan attrition <1 tahun dari 34,9% ke <20% | Tenure Group faktor terkuat (χ²=75.59) |
| **2** | **Review Struktur Gaji (Terutama Q1):** evaluasi kompetitifitas gaji, pertimbangkan kenaikan ke Q2 | Turunkan attrition Q1 dari 29,3% ke <15% | Income Group faktor terkuat kedua (χ²=65.49) |
| **3** | **Program Khusus Talenta Muda (18-25):** jalur karier jelas, rotasi peran, pengembangan skill | Turunkan attrition 18-25 dari 35,8% ke <25% | Attrition tinggi di semua level kepuasan |
| **4** | **Benefit & Fleksibilitas untuk Karyawan Single:** benefit non-finansial, fleksibilitas kerja | Turunkan attrition single dari 25,5% ke <18% | Marital Status signifikan (χ²=46.16) |
| **5** | **Subsidi Transportasi / Fleksibilitas Lokasi:** untuk karyawan jarak >15 km | - | Median jarak resign 9 km vs bertahan 7 km (p=0.0024) |

### ⚠️ Catatan Penting
**JANGAN fokus ke "Departemen".** Department adalah faktor **paling lemah** (χ²=10.80). Intervensi berbasis departemen (misal: "program khusus Sales") **kurang efektif** dibanding intervensi berbasis **tenure, gaji, dan usia.**

---

## 📌 Kesimpulan

Attrition di perusahaan ini dipengaruhi oleh **faktor demografis & kompensasi** (tenure, gaji, usia, status pernikahan) — **BUKAN** oleh departemen atau kepuasan kerja semata.

**Prioritas intervensi:**
1. Karyawan baru (<1 tahun)
2. Karyawan bergaji rendah (Q1)
3. Karyawan muda (18-25)
4. Karyawan single

Rekomendasi ini didukung oleh **validasi statistik** (Chi-Square & Mann-Whitney) sehingga dapat dijadikan dasar pengambilan keputusan HR.

---

## 🛠️ Tools & Library

- **Python 3**
- **Pandas** — manipulasi data
- **NumPy** — komputasi numerik
- **Matplotlib & Seaborn** — visualisasi
- **SciPy** — uji statistik (Chi-Square, Mann-Whitney, Shapiro-Wilk)
- **Google Colab** — environment analisis

---

## 📂 Struktur Repository
