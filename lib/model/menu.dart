class tea {
  final String id;
  final String nama;
  final String harga;
  final String deskripsi;
  final String gambar;

  tea({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

  factory tea.fromJson(Map<String, dynamic> json) {
    return tea(
        id: json['id'] as String,
        nama: json['nama'] as String,
        harga: json['harga'] as String,
        deskripsi: json['deskripsi'] as String,
        gambar: json['gambar'] as String);
  }
}

class coffee {
  final String id;
  final String harga;
  final String nama;
  final String deskripsi;
  final String gambar;

  coffee({
    required this.id,
    required this.harga,
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });

  factory coffee.fromJson(Map<String, dynamic> json) {
    return coffee(
        id: json['id'] as String,
        harga: json['harga'] as String,
        nama: json['nama'] as String,
        deskripsi: json['deskripsi'] as String,
        gambar: json['gambar'] as String);
  }
}

class dessert {
  final String id;
  final String harga;
  final String nama;
  final String deskripsi;
  final String gambar;

  dessert(
      {required this.id,
      required this.nama,
      required this.harga,
      required this.deskripsi,
      required this.gambar});

  factory dessert.fromJson(Map<String, dynamic> json) {
    return dessert(
        id: json['id'] as String,
        nama: json['nama'] as String,
        harga: json['harga'] as String,
        deskripsi: json['deskripsi'] as String,
        gambar: json['gambar'] as String);
  }
}
