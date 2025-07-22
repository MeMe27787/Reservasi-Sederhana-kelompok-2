import 'dart:io';
import 'seat_layout.dart';

void cancelReservation() {
  showSeatLayout();

  // Change the prompt for better clarity and provide option to return to menu
  stdout.write("Masukkan nomor kursi yang ingin dibatalkan (format: baris kolom) atau tekan Enter untuk kembali ke menu: ");
  String? input = stdin.readLineSync();
  
  // If user presses Enter (empty input), go back to the menu
  if (input?.isEmpty ?? false) {
    print("Kembali ke menu utama...");
    return;
  }
  
  List<String> coords = input!.split(' ');

  // Validate input format
  if (coords.length == 2) {
    int row = int.parse(coords[0]) - 1;
    int col = int.parse(coords[1]) - 1;

    // Check if the input is within bounds
    if (row >= 0 && col >= 0 && row < layout.length && col < layout[row].length) {
      if (layout[row][col] == '❌') {
        layout[row][col] = '✅';
        print("Reservasi untuk kursi ${row + 1}-${col + 1} telah dibatalkan.");
      } else {
        print("Kursi ${row + 1}-${col + 1} belum dipesan.");
      }
    } else {
      print("Nomor kursi tidak valid. Coba lagi.");
    }
  } else {
    print("Format input salah. Pastikan formatnya adalah 'baris kolom'. Coba lagi.");
  }

  // Prompt to press Enter to go back to the menu
  stdout.write("\nTekan Enter untuk kembali ke menu...");
  stdin.readLineSync();
  return;  // Return to main menu after cancellation
}
