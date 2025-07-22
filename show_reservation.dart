import 'dart:io';
import 'reservation.dart';  // Import untuk mendapatkan data reservasi

void showReservations() {
  if (reservations.isEmpty) {
    print("Belum ada reservasi.");
  } else {
    print("=== Data Reservasi ===");
    for (int i = 0; i < reservations.length; i++) {
      var reservation = reservations[i];
      print("${i + 1}. Nama: ${reservation['name']}");
      print("   Kursi: ${reservation['seat']}");
      print("   Waktu: ${reservation['time']}\n");
    }
  }
  print("Tekan Enter untuk kembali ke menu...");
  stdin.readLineSync();
}
