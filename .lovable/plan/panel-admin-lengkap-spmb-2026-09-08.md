# Panel Admin Lengkap SPMB

Menambah panel admin yang utuh: ringkasan berbentuk grafik, plus kemampuan menambah dan mengubah data pendaftar langsung oleh operator (untuk pendaftar yang datang ke sekolah / perbaikan data).

## 1. Tab baru "Ringkasan" (halaman awal panel)

Kartu angka di atas:
- Total pendaftar, menunggu verifikasi, terverifikasi, diterima, tidak diterima, daftar ulang selesai.
- Sisa kuota per jurusan (kuota dikurangi yang diterima).

Grafik:
- Batang: jumlah pendaftar per jurusan (pilihan 1).
- Lingkaran/donat: komposisi status pendaftar.
- Garis: tren pendaftaran per hari (30 hari terakhir).
- Batang: peminat laki-laki vs perempuan, dan sebaran asal sekolah 8 terbanyak.
- Batang bertumpuk: kelengkapan dokumen (disetujui / menunggu / ditolak / belum diunggah).

Semua memakai pustaka grafik yang sudah ada di proyek, mengikuti warna tema.

## 2. Tambah & Edit Pendaftar

Di tab "Pendaftar":
- Tombol "Tambah Pendaftar" membuka formulir lengkap (data diri, alamat, sekolah asal, data orang tua, pilihan jurusan 1 & 2, status awal). Nomor pendaftaran dibuat otomatis seperti pendaftaran online.
- Tombol "Edit" pada setiap baris membuka formulir yang sama terisi data pendaftar, operator bisa mengubah semua kolom termasuk status dan nilai seleksi.
- Tombol hapus dengan konfirmasi (untuk data salah input), sekaligus menghapus nilai & dokumen terkait.
- Setiap aksi tercatat di riwayat aktivitas.

Tabel pendaftar juga diperbaiki: kolom NISN, jenis kelamin, skor, pengurutan kolom, jumlah baris per halaman (pagination), pilih-banyak untuk ubah status massal, dan tombol "Unduh CSV" untuk data yang sedang tampil.

## 3. Tab "Riwayat Aktivitas"

Daftar aksi operator (siapa, kapan, apa) dari catatan audit, dengan pencarian.

## Catatan teknis

- Rute baru: `src/routes/_authenticated/operator/ringkasan.tsx` (jadi tab pertama) dan `src/routes/_authenticated/operator/audit.tsx`; navigasi tab di `operator/route.tsx` diperbarui.
- Form pendaftar dipisah ke komponen `src/components/operator/RegistrationForm.tsx` (dipakai untuk tambah dan edit) agar `operator/index.tsx` tetap ringkas; helper agregasi grafik di `src/lib/statistik.ts`.
- Data diambil lewat klien Supabase yang sudah ada (`db` di `src/lib/spmb.ts`) dengan TanStack Query. Kebijakan RLS "pendaftaran dikelola operator" sudah mengizinkan tambah/ubah/hapus untuk staf, jadi tidak perlu migrasi database. Baris baru buatan operator memakai `user_id` operator, dan status non-draft memicu penomoran otomatis yang sudah ada.
- Grafik memakai `recharts` + `@/components/ui/chart` yang sudah terpasang; tidak ada dependensi baru.
