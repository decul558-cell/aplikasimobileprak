import 'dart:io';

// ================================================
// A. CLASS
// ================================================
class Mahasiswa {
  String nama = "Anang";

  void tampilkanData() {
    print(nama);
  }
}

// ================================================
// B. OBJECT
// ================================================
class MahasiswaLengkap {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

// ================================================
// C. EXTENDS
// ================================================
class MahasiswaBase {
  String? nama;
  int? nim;
  String? jurusan;

  MahasiswaBase({this.nama, this.nim, this.jurusan});

  void tampilkanData() {
    print("Nama   : ${nama ?? '-'}");
    print("NIM    : ${nim ?? '-'}");
    print("Jurusan: ${jurusan ?? '-'}");
  }
}

class MahasiswaAktif extends MahasiswaBase {
  String? semester;
  String? statusBeasiswa;

  MahasiswaAktif({
    String? nama,
    int? nim,
    String? jurusan,
    this.semester,
    this.statusBeasiswa,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Semester       : ${semester ?? '-'}");
    print("Status Beasiswa: ${statusBeasiswa ?? 'Tidak ada'}");
  }

  void daftarMataKuliah() {
    print("$nama mendaftar mata kuliah semester $semester");
  }
}

class MahasiswaAlumni extends MahasiswaBase {
  int? tahunLulus;
  String? tempatKerja;

  MahasiswaAlumni({
    String? nama,
    int? nim,
    String? jurusan,
    this.tahunLulus,
    this.tempatKerja,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Tahun Lulus : ${tahunLulus ?? '-'}");
    print("Tempat Kerja: ${tempatKerja ?? '-'}");
  }

  void cetakIjazah() {
    print("Mencetak ijazah untuk $nama lulusan $tahunLulus");
  }
}

// ================================================
// D. MIXIN
// ================================================
mixin BisaMengajar {
  String mataPelajaran = "Umum";
  void mengajar() => print("Mengajar: $mataPelajaran");
  void buatSoalUjian() => print("Membuat soal ujian: $mataPelajaran");
}

mixin BisaMeneliti {
  String topikPenelitian = "Teknologi Informasi";
  void melakukanPenelitian() => print("Meneliti: $topikPenelitian");
  void publikasiJurnal() => print("Publikasi jurnal: $topikPenelitian");
}

mixin BisaAdministrasi {
  void buatLaporan() => print("Membuat laporan administrasi");
  void kelolaData() => print("Mengelola data akademik");
}

class Dosen extends MahasiswaBase
    with BisaMengajar, BisaMeneliti, BisaAdministrasi {
  String? nip;
  String? jabatan;

  Dosen({
    String? nama,
    int? nim,
    String? jurusan,
    this.nip,
    this.jabatan,
    String mataPelajaran = "Umum",
    String topikPenelitian = "Teknologi Informasi",
  }) : super(nama: nama, nim: nim, jurusan: jurusan) {
    this.mataPelajaran = mataPelajaran;
    this.topikPenelitian = topikPenelitian;
  }

  @override
  void tampilkanData() {
    print("Nama   : ${nama ?? '-'}");
    print("NIP    : ${nip ?? '-'}");
    print("Jabatan: ${jabatan ?? '-'}");
    print("Jurusan: ${jurusan ?? '-'}");
  }
}

class Fakultas extends MahasiswaBase with BisaAdministrasi, BisaMeneliti {
  String? namaFakultas;
  String? dekan;

  Fakultas({
    this.namaFakultas,
    this.dekan,
    String? jurusan,
    String topikPenelitian = "Riset Fakultas",
  }) : super(jurusan: jurusan) {
    this.topikPenelitian = topikPenelitian;
  }

  @override
  void tampilkanData() {
    print("Nama Fakultas: ${namaFakultas ?? '-'}");
    print("Dekan        : ${dekan ?? '-'}");
    print("Jurusan      : ${jurusan ?? '-'}");
  }
}

// ================================================
// MAIN — wajib ada agar bisa dijalankan
// ================================================
void main() {

  // ---- A. CLASS ----
  print("======= A. CLASS =======");
  var mhs1 = Mahasiswa();
  mhs1.tampilkanData();

  stdout.write("Masukkan nama baru: ");
  String? namaBaru = stdin.readLineSync();
  if (namaBaru != null && namaBaru.isNotEmpty) {
    mhs1.nama = namaBaru;
    print("Nama berhasil diubah.");
    mhs1.tampilkanData();
  } else {
    print("Nama tidak boleh kosong.");
  }

  // ---- B. OBJECT ----
  print("\n======= B. OBJECT =======");
  MahasiswaLengkap mhs = MahasiswaLengkap();
  print("Masukkan Nama Mahasiswa:");
  mhs.nama = stdin.readLineSync();
  print("Masukkan NIM Mahasiswa:");
  mhs.nim = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  print("Masukkan Jurusan Mahasiswa:");
  mhs.jurusan = stdin.readLineSync();
  mhs.tampilkanData();

  // ---- C. EXTENDS ----
  print("\n======= C. EXTENDS =======");

  print("-- MahasiswaAktif --");
  var aktif = MahasiswaAktif(
    nama: "Budi Santoso",
    nim: 2023001,
    jurusan: "D4 Teknik Informatika",
    semester: "3",
    statusBeasiswa: "KIP Kuliah",
  );
  aktif.tampilkanData();
  aktif.daftarMataKuliah();

  print("\n-- MahasiswaAlumni --");
  var alumni = MahasiswaAlumni(
    nama: "Sari Dewi",
    nim: 2019002,
    jurusan: "D4 Teknik Informatika",
    tahunLulus: 2023,
    tempatKerja: "PT. Telkom Indonesia",
  );
  alumni.tampilkanData();
  alumni.cetakIjazah();

  // ---- D. MIXIN ----
  print("\n======= D. MIXIN =======");

  print("-- Dosen --");
  var dosen = Dosen(
    nama: "Dr. Ahmad Fauzi",
    nip: "198501012010011001",
    jabatan: "Lektor Kepala",
    jurusan: "Teknik Informatika",
    mataPelajaran: "Pemrograman Mobile",
    topikPenelitian: "Kecerdasan Buatan",
  );
  dosen.tampilkanData();
  dosen.mengajar();
  dosen.melakukanPenelitian();
  dosen.buatLaporan();

  print("\n-- Fakultas --");
  var fak = Fakultas(
    namaFakultas: "Fakultas Teknologi Informasi",
    dekan: "Prof. Dr. Hendra Wijaya",
    jurusan: "Teknik Informatika",
    topikPenelitian: "Transformasi Digital",
  );
  fak.tampilkanData();
  fak.melakukanPenelitian();
  fak.buatLaporan();
  fak.kelolaData();
}