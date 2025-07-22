List<List<String>> layout = [
  ['✅', '✅', '✅', '✅', '✅'],
  ['✅', '✅', '✅', '✅', '✅'],
  ['✅', '✅', '✅', '✅', '✅'],
  ['✅', '✅', '✅', '✅', '✅'],
];

void showSeatLayout() {
  print("=== Layout Tempat Duduk ===");
  for (int i = 0; i < layout.length; i++) {
    print("${i + 1}. ${layout[i].join(' ')}");
  }
}
