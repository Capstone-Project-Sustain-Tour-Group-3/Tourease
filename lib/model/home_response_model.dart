class HomeResponseModel {
  String? status;
  String? message;
  Data? data;

  HomeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
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
  List<Destinasi>? destinasiRekomendasi;
  List<Destinasi>? destinasiSekitar;
  List<DestinasiPopuler>? destinasiPopuler;

  Data({
    this.destinasiRekomendasi,
    this.destinasiSekitar,
    this.destinasiPopuler,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        destinasiRekomendasi: json["destinasi_rekomendasi"] == null
            ? []
            : List<Destinasi>.from(json["destinasi_rekomendasi"]!
                .map((x) => Destinasi.fromJson(x))),
        destinasiSekitar: json["destinasi_sekitar"] == null
            ? []
            : List<Destinasi>.from(
                json["destinasi_sekitar"]!.map((x) => Destinasi.fromJson(x))),
        destinasiPopuler: json["destinasi_populer"] == null
            ? []
            : List<DestinasiPopuler>.from(json["destinasi_populer"]!
                .map((x) => DestinasiPopuler.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "destinasi_rekomendasi": destinasiRekomendasi == null
            ? []
            : List<dynamic>.from(destinasiRekomendasi!.map((x) => x.toJson())),
        "destinasi_sekitar": destinasiSekitar == null
            ? []
            : List<dynamic>.from(destinasiSekitar!.map((x) => x.toJson())),
        "destinasi_populer": destinasiPopuler == null
            ? []
            : List<dynamic>.from(destinasiPopuler!.map((x) => x.toJson())),
      };
}

class DestinasiPopuler {
  String? id;
  String? nama;
  Konten? konten;

  DestinasiPopuler({
    this.id,
    this.nama,
    this.konten,
  });

  factory DestinasiPopuler.fromJson(Map<String, dynamic> json) =>
      DestinasiPopuler(
        id: json["id"],
        nama: json["nama"],
        konten: json["konten"] == null ? null : Konten.fromJson(json["konten"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "konten": konten?.toJson(),
      };
}

class Konten {
  String? id;
  String? judul;
  String? url;

  Konten({
    this.id,
    this.judul,
    this.url,
  });

  factory Konten.fromJson(Map<String, dynamic> json) => Konten(
        id: json["id"],
        judul: json["judul"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "url": url,
      };
}

class Destinasi {
  String? id;
  String? nama;
  String? urlGambar;
  Provinsi? provinsi;
  Lokasi? lokasi;

  Destinasi({
    this.id,
    this.nama,
    this.urlGambar,
    this.provinsi,
    this.lokasi,
  });

  factory Destinasi.fromJson(Map<String, dynamic> json) => Destinasi(
        id: json["id"],
        nama: json["nama"],
        urlGambar: json["url_gambar"],
        provinsi: json["provinsi"] == null
            ? null
            : Provinsi.fromJson(json["provinsi"]),
        lokasi: json["lokasi"] == null ? null : Lokasi.fromJson(json["lokasi"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url_gambar": urlGambar,
        "provinsi": provinsi?.toJson(),
        "lokasi": lokasi?.toJson(),
      };
}

class Lokasi {
  Provinsi? kota;
  Provinsi? provinsi;

  Lokasi({
    this.kota,
    this.provinsi,
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
        kota: json["kota"] == null ? null : Provinsi.fromJson(json["kota"]),
        provinsi: json["provinsi"] == null
            ? null
            : Provinsi.fromJson(json["provinsi"]),
      );

  Map<String, dynamic> toJson() => {
        "kota": kota?.toJson(),
        "provinsi": provinsi?.toJson(),
      };
}

class Provinsi {
  String? nama;

  Provinsi({
    this.nama,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}
