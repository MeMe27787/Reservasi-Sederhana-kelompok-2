import 'dart:io';
import 'reservation.dart';
import 'cancel.dart';
import 'show_reservation.dart';

void showMenu() {
  while (true) {
    print("=== Aplikasi Reservasi ===");
    print("1. Pemesanan");
    print("2. Data Reservasi");
    print("3. Batal");
    print("4. Keluar");
    stdout.write("Pilih opsi: ");
    
    String? pilihan = stdin.readLineSync();
    
    switch (pilihan) {
      case '1':
        makeReservation();
        break;
      case '2':
        showReservations();
        break;
      case '3':
        cancelReservation();
        break;
      case '4':
        print("Terima kasih telah menggunakan aplikasi!");
        return;
      default:
        print("Opsi tidak valid. Coba lagi.");
    }
  }
}
