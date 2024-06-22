class RouteRequestModel {
  String? idKota;
  LokasiAwalRequest? lokasiAwal;
  List<String>? idDestinasiTujuan;

  RouteRequestModel({
    this.idKota,
    this.lokasiAwal,
    this.idDestinasiTujuan,
  });

  factory RouteRequestModel.fromJson(Map<String, dynamic> json) =>
      RouteRequestModel(
        idKota: json["id_kota"],
        lokasiAwal: json["lokasi_awal"] == null
            ? null
            : LokasiAwalRequest.fromJson(json["lokasi_awal"]),
        idDestinasiTujuan: json["id_destinasi_tujuan"] == null
            ? []
            : List<String>.from(json["id_destinasi_tujuan"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_kota": idKota,
        "lokasi_awal": lokasiAwal?.toJson(),
        "id_destinasi_tujuan": idDestinasiTujuan == null
            ? []
            : List<dynamic>.from(idDestinasiTujuan!.map((x) => x)),
      };
}

class LokasiAwalRequest {
  String? nama;
  double? latitude;
  double? longitude;

  LokasiAwalRequest({
    this.nama,
    this.latitude,
    this.longitude,
  });

  factory LokasiAwalRequest.fromJson(Map<String, dynamic> json) =>
      LokasiAwalRequest(
        nama: json["nama"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "latitude": latitude,
        "longitude": longitude,
      };
}