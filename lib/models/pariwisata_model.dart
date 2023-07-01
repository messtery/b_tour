class PariwisataModel {
  int? id;
  String? gambar;
  String? judul;
  String? deskripsi;
  String? lokasi;
  String? provinsi;

  PariwisataModel(
    this.id,
    this.gambar,
    this.judul,
    this.deskripsi,
    this.lokasi,
    this.provinsi,
  );
  PariwisataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    gambar = json["gambar"];
    judul = json["judul"];
    deskripsi = json["deskripsi"];
    lokasi = json["lokasi"];
    provinsi = json["provinsi"];
  }
}
