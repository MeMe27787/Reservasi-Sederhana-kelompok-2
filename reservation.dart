import 'dart:io';
import 'seat_layout.dart';

// List untuk menyimpan data pemesanan
List<Map<String, String>> reservations = [];

void makeReservation() {
  showSeatLayout();

  // Meminta nama pemesan
  stdout.write("Masukkan nama pemesan: ");
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    print("Nama tidak boleh kosong.");
    return;
  }

  // Meminta waktu pemesanan
  stdout.write("Masukkan waktu pemesanan (format: YYYY-MM-DD HH:MM): ");
  String? time = stdin.readLineSync();
  if (time == null || time.trim().isEmpty) {
    print("Waktu pemesanan tidak boleh kosong.");
    return;
  }

  // Menampilkan petunjuk pemilihan kursi
  print("\nPilih kursi dengan format: <baris> <kolom>");
  print("Contoh: '1 3' untuk memilih kursi baris 1 kolom 3.");
  stdout.write("Pilih nomor kursi: ");
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print("Input kursi tidak boleh kosong.");
    return;
  }

  List<String> coords = input.trim().split(' ');

  if (coords.length != 2) {
    print("Format input salah. Gunakan format: <baris> <kolom> (misal: 1 3).");
    return;
  }

  try {
    int row = int.parse(coords[0]) - 1;
    int col = int.parse(coords[1]) - 1;

    // Validasi indeks dalam batas layout
    if (row < 0 || row >= layout.length || col < 0 || col >= layout[row].length) {
      print("Nomor kursi tidak valid. Baris atau kolom melebihi batas.");
      return;
    }

    if (layout[row][col] == '✅') {
      layout[row][col] = '❌';

      reservations.add({
        'name': name,
        'seat': 'Baris ${row + 1}, Kolom ${col + 1}',
        'time': time
      });

      print("\nReservasi berhasil!");
      print("Nama Pemesan   : $name");
      print("Kursi yang dipilih : Baris ${row + 1}, Kolom ${col + 1}");
      print("Waktu Pemesanan: $time");

      stdout.write("\nTekan Enter untuk kembali ke menu...");
      stdin.readLineSync();
    } else {
      print("Kursi sudah dipesan!");
    }
  } catch (e) {
    print("Terjadi kesalahan saat membaca input kursi. Pastikan format angka benar.");
  }
}
