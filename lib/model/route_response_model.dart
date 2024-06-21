class RouteResponseModel {
  String? status;
  String? message;
  Data? data;

  RouteResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory RouteResponseModel.fromJson(Map<String, dynamic> json) =>
      RouteResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  LokasiAwal? lokasiAwal;
  List<DetailRute>? detailRute;
  EstimasiBiaya? estimasiBiaya;

  Data({
    this.lokasiAwal,
    this.detailRute,
    this.estimasiBiaya,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lokasiAwal: json["lokasi_awal"] == null
            ? null
            : LokasiAwal.fromJson(json["lokasi_awal"]),
        detailRute: json["detail_rute"] == null
            ? []
            : List<DetailRute>.from(
                json["detail_rute"]!.map((x) => DetailRute.fromJson(x))),
        estimasiBiaya: json["estimasi_biaya"] == null
            ? null
            : EstimasiBiaya.fromJson(json["estimasi_biaya"]),
      );

  Map<String, dynamic> toJson() => {
        "lokasi_awal": lokasiAwal?.toJson(),
        "detail_rute": detailRute == null
            ? []
            : List<dynamic>.from(detailRute!.map((x) => x.toJson())),
        "estimasi_biaya": estimasiBiaya?.toJson(),
      };
}

class DetailRute {
  Destinasi? destinasi;
  Durasi? durasi;
  int? urutan;
  String? waktuKunjungan;
  String? waktuSelesai;

  DetailRute({
    this.destinasi,
    this.durasi,
    this.urutan,
    this.waktuKunjungan,
    this.waktuSelesai,
  });

  factory DetailRute.fromJson(Map<String, dynamic> json) => DetailRute(
        destinasi: json["destinasi"] == null
            ? null
            : Destinasi.fromJson(json["destinasi"]),
        durasi: json["durasi"] == null ? null : Durasi.fromJson(json["durasi"]),
        urutan: json["urutan"],
        waktuKunjungan: json["waktu_kunjungan"],
        waktuSelesai: json["waktu_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "destinasi": destinasi?.toJson(),
        "durasi": durasi?.toJson(),
        "urutan": urutan,
        "waktu_kunjungan": waktuKunjungan,
        "waktu_selesai": waktuSelesai,
      };
}

class Destinasi {
  String? id;
  String? nama;
  double? latitude;
  double? longitude;
  String? urlGambar;
  EstimasiBiaya? biayaMasuk;

  Destinasi({
    this.id,
    this.nama,
    this.latitude,
    this.longitude,
    this.urlGambar,
    this.biayaMasuk,
  });

  factory Destinasi.fromJson(Map<String, dynamic> json) => Destinasi(
        id: json["id"],
        nama: json["nama"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        urlGambar: json["url_gambar"],
        biayaMasuk: json["biaya_masuk"] == null
            ? null
            : EstimasiBiaya.fromJson(json["biaya_masuk"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "latitude": latitude,
        "longitude": longitude,
        "url_gambar": urlGambar,
        "biaya_masuk": biayaMasuk?.toJson(),
      };
}

class EstimasiBiaya {
  int? raw;
  String? format;

  EstimasiBiaya({
    this.raw,
    this.format,
  });

  factory EstimasiBiaya.fromJson(Map<String, dynamic> json) => EstimasiBiaya(
        raw: json["raw"],
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "format": format,
      };
}

class Durasi {
  int? raw;
  String? simple;
  String? full;

  Durasi({
    this.raw,
    this.simple,
    this.full,
  });

  factory Durasi.fromJson(Map<String, dynamic> json) => Durasi(
        raw: json["raw"],
        simple: json["simple"],
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "simple": simple,
        "full": full,
      };
}

class LokasiAwal {
  String? nama;
  double? latitude;
  double? longitude;

  LokasiAwal({
    this.nama,
    this.latitude,
    this.longitude,
  });

  factory LokasiAwal.fromJson(Map<String, dynamic> json) => LokasiAwal(
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
