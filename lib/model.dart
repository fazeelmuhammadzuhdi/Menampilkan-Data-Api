class cModel {
  String id;
  String namaBarang;
  String deskripsi;
  String foto;
  String harga;

  cModel({
    required this.id,
    required this.namaBarang,
    required this.deskripsi,
    required this.foto,
    required this.harga,
  });

  factory cModel.fromJson(Map<String, dynamic> json) {
    return cModel(
      id: json['id'],
      namaBarang: json['namaBarang'],
      deskripsi: json['deskripsi'],
      foto: json['foto'],
      harga: json['harga'],
    );
  }
}
