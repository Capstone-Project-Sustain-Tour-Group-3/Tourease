class SearchDestinasiResponse {
  String? status;
  String? message;
  List<Destinasi>? data;
  Pagination? pagination;
  String? sort;
  String? filter;

  SearchDestinasiResponse({
    this.status,
    this.message,
    this.data,
    this.pagination,
    this.sort,
    this.filter,
  });

  factory SearchDestinasiResponse.fromJson(Map<String, dynamic> json) =>
      SearchDestinasiResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Destinasi>.from(
                json["data"]!.map((x) => Destinasi.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        sort: json["sort"],
        filter: json["filter"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
        "sort": sort,
        "filter": filter,
      };
}

class Destinasi {
  String? id;
  String? nama;
  String? urlMedia;
  String? provinsi;
  String? kota;
  List<Kategori>? kategori;

  Destinasi({
    this.id,
    this.nama,
    this.urlMedia,
    this.provinsi,
    this.kota,
    this.kategori,
  });

  factory Destinasi.fromJson(Map<String, dynamic> json) => Destinasi(
        id: json["id"],
        nama: json["nama"],
        urlMedia: json["url_media"],
        provinsi: json["provinsi"],
        kota: json["kota"],
        kategori: json["kategori"] == null
            ? []
            : List<Kategori>.from(
                json["kategori"]!.map((x) => Kategori.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url_media": urlMedia,
        "provinsi": provinsi,
        "kota": kota,
        "kategori": kategori == null
            ? []
            : List<dynamic>.from(kategori!.map((x) => x.toJson())),
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

class Pagination {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Pagination({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "last_page": lastPage,
      };
}