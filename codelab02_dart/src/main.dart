void main() {
  for (int i = 18; i > 8; i--) {
    print("Nama saya adalah Tionusa, sekarang berumur $i");
  }
  print("");

  String nama = "Tionusa";
  String? doesnotusenullsafety; // bisa null

  print("Nama: $nama");
  print("Null safety: $doesnotusenullsafety");

  print("");

  late String alamat; // diinisialisasi nanti
  alamat = "Malang";
  print("Alamat: $alamat");
}
