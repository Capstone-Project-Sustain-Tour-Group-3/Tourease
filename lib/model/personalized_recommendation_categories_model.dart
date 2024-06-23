class PersonalizedCategoriesModel {
  String? status;
  String? message;
  List<DataKategori>? data;

  PersonalizedCategoriesModel({
    this.status,
    this.message,
    this.data,
  });

  factory PersonalizedCategoriesModel.fromJson(Map<String, dynamic> json) =>
      PersonalizedCategoriesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataKategori>.from(
                json["data"]!.map((x) => DataKategori.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataKategori {
  String? kategoriId;
  String? nama;
  String? url;

  DataKategori({
    this.kategoriId,
    this.nama,
    this.url,
  });

  factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
        kategoriId: json["kategori_id"],
        nama: json["nama"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "kategori_id": kategoriId,
        "nama": nama,
        "url": url,
      };
}
