# ============================================
# PERBANDINGAN TUGAS KELOMPOK 1 & 2 - MULTIVARIAT
# ============================================

cat("==================================================\n")
cat("  PERBANDINGAN TUGAS KELOMPOK 1 & 2 - MULTIVARIAT\n")
cat("==================================================\n\n")

# --- TUGAS KELOMPOK 1 ---
cat("📘 TUGAS KELOMPOK 1\n")
cat("Judul: Perbandingan Rasio Layanan Pendidikan SMP\n")
cat("       antara Kabupaten/Kota di Jawa dan Sumatra 2025\n")
cat("--------------------------------------------------\n")

cat("\n🔹 VARIABEL INDEPENDEN (Faktor/Grup):\n")
cat("   - Kelompok Wilayah (Nominal, 2 level):\n")
cat("     * Jawa    (n1 = 119)\n")
cat("     * Sumatra (n2 = 154)\n")

cat("\n🔹 VARIABEL DEPENDEN (Respon, p = 3, Skala Rasio):\n")
dep1 <- data.frame(
  Kode = c("X1", "X2", "X3"),
  Nama = c("Siswa per rombongan belajar",
           "Siswa per ruang kelas",
           "Siswa per kepala sekolah dan guru"),
  Rumus = c("Siswa / Rombel",
            "Siswa / Ruang Kelas",
            "Siswa / (Kepsek + Guru)")
)
print(dep1, row.names = FALSE)

cat("\n🔹 UJI YANG DIGUNAKAN:\n")
cat("   - Hotelling T2 (2 kelompok)\n")
cat("   - Wald-Type Statistic (WTS) + Bootstrap\n")

cat("\n🔹 HASIL UTAMA:\n")
hasil1 <- data.frame(
  Metrik = c("Hotelling T2", "F hitung", "F kritis (0.05)",
             "Nilai p", "WTS", "p bootstrap"),
  Nilai = c("273.5820", "90.5210", "2.6382",
            "< 1e-10", "293.1707", "0.0001")
)
print(hasil1, row.names = FALSE)

cat("\n🔹 SELISIH MEAN (Jawa - Sumatra):\n")
selisih1 <- data.frame(
  Variabel = c("X1", "X2", "X3"),
  Selisih = c(2.6471, 4.1958, 5.0898),
  CI_Bonferroni = c("[1.9324; 3.3618]",
                    "[3.2559; 5.1356]",
                    "[4.2791; 5.9006]")
)
print(selisih1, row.names = FALSE)

cat("\n✅ KESIMPULAN KELOMPOK 1:\n")
cat("   H0 DITOLAK. Terdapat perbedaan signifikan antara\n")
cat("   rata-rata rasio layanan pendidikan SMP di Jawa vs Sumatra.\n")
cat("   Jawa memiliki rata-rata rasio LEBIH TINGGI pada ketiga indikator.\n")
cat("   Selisih terbesar ada pada X3 (siswa per kepsek & guru).\n")
cat("   Catatan: Asumsi normalitas & homogenitas tidak terpenuhi,\n")
cat("   sehingga kesimpulan diperkuat dengan WTS + Bootstrap.\n\n")

cat("==================================================\n\n")

# --- TUGAS KELOMPOK 2 ---
cat("📘 TUGAS KELOMPOK 2\n")
cat("Judul: MANOVA Dua Arah - Pengaruh Urban & US terhadap\n")
cat("       Sales, Advertising, Price pada Dataset Carseats\n")
cat("--------------------------------------------------\n")

cat("\n🔹 VARIABEL INDEPENDEN (2 Faktor Kategorik):\n")
cat("   - Urban (2 level): No, Yes\n")
cat("   - US    (2 level): No, Yes\n")
cat("   - Interaksi: Urban x US (2x2 = 4 sel)\n")

cat("\n🔹 VARIABEL DEPENDEN (Respon, p = 3, Skala Rasio):\n")
dep2 <- data.frame(
  Variabel = c("Sales", "Advertising", "Price"),
  Keterangan = c("Penjualan kursi mobil",
                 "Biaya iklan lokal",
                 "Harga jual kursi mobil"),
  Satuan = c("unit", "ribu $", "$")
)
print(dep2, row.names = FALSE)

cat("\n🔹 UKURAN SEL (2x2):\n")
sel <- data.frame(
  Urban = c("No", "Yes", "Total"),
  US_No = c(46, 96, 142),
  US_Yes = c(72, 186, 258),
  Total = c(118, 282, 400)
)
print(sel, row.names = FALSE)

cat("\n🔹 HASIL UJI ASUMSI:\n")
cat("   - Normalitas Multivariat (Mardia & Henze-Zirkler):\n")
cat("     * No/No  & Yes/No : p < 0.001  -> TIDAK NORMAL\n")
cat("     * No/Yes & Yes/Yes: p > 0.05   -> NORMAL\n")
cat("   - Box's M: p < 0.001 -> Kovarians TIDAK HOMOGEN\n")
cat("   -> Karena tidak homogen, pakai PILLAI'S TRACE (lebih robust)\n")

cat("\n🔹 HASIL TWO-WAY MANOVA (Pillai's Trace):\n")
manova2 <- data.frame(
  Efek = c("Urban", "US", "Urban x US"),
  Pillai = c(0.002, 0.429, 0.008),
  F = c(0.230, 98.618, 1.110),
  Sig = c(0.876, "< 0.001", 0.345),
  Keputusan = c("Tidak Signifikan",
                "SIGNIFIKAN",
                "Tidak Signifikan")
)
print(manova2, row.names = FALSE)

cat("\n🔹 HASIL ANOVA UNIVARIAT LANJUTAN:\n")
anova2 <- data.frame(
  Variabel = c("Sales", "Sales", "Sales",
               "Advertising", "Advertising", "Advertising",
               "Price", "Price", "Price"),
  Faktor = c("Urban", "US", "Urban x US",
             "Urban", "US", "Urban x US",
             "Urban", "US", "Urban x US"),
  F = c(0.001, 16.055, 3.039,
        0.067, 296.022, 0.000,
        0.540, 0.703, 0.237),
  Sig = c(0.976, "< 0.001", 0.082,
          0.797, "< 0.001", 0.995,
          0.463, 0.403, 0.627)
)
print(anova2, row.names = FALSE)

cat("\n✅ KESIMPULAN KELOMPOK 2:\n")
cat("   1. Urban: TIDAK signifikan (p = 0.876)\n")
cat("   2. US   : SIGNIFIKAN (p < 0.001)\n")
cat("   3. Urban x US: TIDAK signifikan (p = 0.345)\n")
cat("   Analisis univariat:\n")
cat("   - Sales       : dipengaruhi US (F = 16.055, p < 0.001)\n")
cat("   - Advertising : SANGAT dipengaruhi US (F = 296.022, p < 0.001)\n")
cat("   - Price       : TIDAK dipengaruhi US (F = 0.703, p = 0.403)\n")
cat("   Kesimpulan: Status lokasi di Amerika Serikat (US) adalah\n")
cat("   faktor utama yang membedakan kinerja penjualan kursi mobil.\n\n")

cat("==================================================\n\n")

# --- PERBANDINGAN ---
cat("📊 PERBANDINGAN 2 TUGAS\n")
cat("--------------------------------------------------\n")
perbandingan <- data.frame(
  Aspek = c("Desain", "Jumlah Grup", "Uji Utama",
            "Jumlah Respon", "Jumlah Observasi",
            "Asumsi Normal", "Asumsi Homogen",
            "Statistik Utama", "Kesimpulan"),
  Kelompok_1 = c("1 faktor (2 grup)", "2", "Hotelling T2",
                 "3", "273",
                 "Tidak terpenuhi", "Tidak homogen",
                 "WTS + Bootstrap", "Jawa != Sumatra"),
  Kelompok_2 = c("2 faktor (2x2)", "4", "Two-Way MANOVA",
                 "3", "400",
                 "Sebagian (2/4 normal)", "Tidak homogen",
                 "Pillai's Trace", "US signifikan; Urban & interaksi tidak")
)
print(perbandingan, row.names = FALSE)

cat("\n==================================================\n")
cat("🎯 KESIMPULAN BESAR\n")
cat("--------------------------------------------------\n")
kesimpulan <- data.frame(
  Tugas = c("Kelompok 1", "Kelompok 2"),
  Faktor_Signifikan = c("Wilayah (Jawa vs Sumatra)",
                        "US (Amerika Serikat)"),
  Faktor_Tidak_Signifikan = c("-",
                              "Urban, Urban x US")
)
print(kesimpulan, row.names = FALSE)

cat("\n💡 PELAJARAN PENTING:\n")
cat("   1. Kalau asumsi normalitas & homogenitas tidak terpenuhi,\n")
cat("      pakai uji alternatif yang lebih robust (WTS, bootstrap,\n")
cat("      atau Pillai's Trace).\n")
cat("   2. Jangan hanya bergantung pada satu uji (misal Hotelling T2)\n")
cat("      saat asumsi dilanggar.\n")
cat("   3. MANOVA dua arah memungkinkan uji efek utama + interaksi\n")
cat("      secara simultan.\n\n")

cat("==================================================\n")
cat("Selesai! Semangat UTS Multivariat! 🚀\n")
cat("==================================================\n")
