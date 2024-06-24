class DetailDestinasiResponseModel {
  String? status;
  String? message;
  Data? data;

  DetailDestinasiResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailDestinasiResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailDestinasiResponseModel(
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
  String? idDestinasi;
  String? namaDestinasi;
  String? jamBuka;
  String? jamTutup;
  int? hargaMasuk;
  int? visitCount;
  String? deskripsi;
  AlamatDestinasi? alamatDestinasi;
  List<Url>? urlGambar;
  List<Url>? urlVideo;
  Kategori? kategori;
  List<Fasilita>? fasilitas;
  List<DestinasiSerupa>? destinasiSerupa;

  Data({
    this.idDestinasi,
    this.namaDestinasi,
    this.jamBuka,
    this.jamTutup,
    this.hargaMasuk,
    this.visitCount,
    this.deskripsi,
    this.alamatDestinasi,
    this.urlGambar,
    this.urlVideo,
    this.kategori,
    this.fasilitas,
    this.destinasiSerupa,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idDestinasi: json["id_destinasi"],
        namaDestinasi: json["nama_destinasi"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        hargaMasuk: json["harga_masuk"],
        visitCount: json["visit_count"],
        deskripsi: json["deskripsi"],
        alamatDestinasi: json["alamat_destinasi"] == null
            ? null
            : AlamatDestinasi.fromJson(json["alamat_destinasi"]),
        urlGambar: json["url_gambar"] == null
            ? []
            : List<Url>.from(json["url_gambar"]!.map((x) => Url.fromJson(x))),
        urlVideo: json["url_video"] == null
            ? []
            : List<Url>.from(json["url_video"]!.map((x) => Url.fromJson(x))),
        kategori: json["kategori"] == null
            ? null
            : Kategori.fromJson(json["kategori"]),
        fasilitas: json["fasilitas"] == null
            ? []
            : List<Fasilita>.from(
                json["fasilitas"]!.map((x) => Fasilita.fromJson(x))),
        destinasiSerupa: json["destinasi_serupa"] == null
            ? []
            : List<DestinasiSerupa>.from(json["destinasi_serupa"]!
                .map((x) => DestinasiSerupa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_destinasi": idDestinasi,
        "nama_destinasi": namaDestinasi,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "harga_masuk": hargaMasuk,
        "visit_count": visitCount,
        "deskripsi": deskripsi,
        "alamat_destinasi": alamatDestinasi?.toJson(),
        "url_gambar": urlGambar == null
            ? []
            : List<dynamic>.from(urlGambar!.map((x) => x.toJson())),
        "url_video": urlVideo == null
            ? []
            : List<dynamic>.from(urlVideo!.map((x) => x.toJson())),
        "kategori": kategori?.toJson(),
        "fasilitas": fasilitas == null
            ? []
            : List<dynamic>.from(fasilitas!.map((x) => x.toJson())),
        "destinasi_serupa": destinasiSerupa == null
            ? []
            : List<dynamic>.from(destinasiSerupa!.map((x) => x.toJson())),
      };
}

class AlamatDestinasi {
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? namaJalan;
  String? kodePos;

  AlamatDestinasi({
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.namaJalan,
    this.kodePos,
  });

  factory AlamatDestinasi.fromJson(Map<String, dynamic> json) =>
      AlamatDestinasi(
        provinsi: json["provinsi"],
        kota: json["kota"],
        kecamatan: json["kecamatan"],
        namaJalan: json["nama_jalan"],
        kodePos: json["kode_pos"],
      );

  Map<String, dynamic> toJson() => {
        "provinsi": provinsi,
        "kota": kota,
        "kecamatan": kecamatan,
        "nama_jalan": namaJalan,
        "kode_pos": kodePos,
      };
}

class DestinasiSerupa {
  String? id;
  String? nama;
  String? urlMedia;
  String? provinsi;
  String? kota;
  int? visitCount;
  Kategori? kategori;

  DestinasiSerupa({
    this.id,
    this.nama,
    this.urlMedia,
    this.provinsi,
    this.kota,
    this.visitCount,
    this.kategori,
  });

  factory DestinasiSerupa.fromJson(Map<String, dynamic> json) =>
      DestinasiSerupa(
        id: json["id"],
        nama: json["nama"],
        urlMedia: json["url_media"],
        provinsi: json["provinsi"],
        kota: json["kota"],
        visitCount: json["visit_count"],
        kategori: json["kategori"] == null
            ? null
            : Kategori.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url_media": urlMedia,
        "provinsi": provinsi,
        "kota": kota,
        "visit_count": visitCount,
        "kategori": kategori?.toJson(),
      };
}

class Kategori {
  String? idKategori;
  String? nama;

  Kategori({
    this.idKategori,
    this.nama,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        idKategori: json["id_kategori"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id_kategori": idKategori,
        "nama": nama,
      };
}

class Fasilita {
  String? idFasilitas;
  String? nama;
  String? urlLogo;

  Fasilita({
    this.idFasilitas,
    this.nama,
    this.urlLogo,
  });

  factory Fasilita.fromJson(Map<String, dynamic> json) => Fasilita(
        idFasilitas: json["id_fasilitas"],
        nama: json["nama"],
        urlLogo: json["url_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id_fasilitas": idFasilitas,
        "nama": nama,
        "url_logo": urlLogo,
      };
}

class Url {
  String? idMedia;
  String? urlMedia;
  String? tipe;
  String? judul;

  Url({
    this.idMedia,
    this.urlMedia,
    this.tipe,
    this.judul,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        idMedia: json["id_media"],
        urlMedia: json["url_media"],
        tipe: json["tipe"],
        judul: json["judul"],
      );

  Map<String, dynamic> toJson() => {
        "id_media": idMedia,
        "url_media": urlMedia,
        "tipe": tipe,
        "judul": judul,
      };
}
