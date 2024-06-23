class PersonalizedProvincesModel {
  String? status;
  String? message;
  List<Datum>? data;

  PersonalizedProvincesModel({
    this.status,
    this.message,
    this.data,
  });

  factory PersonalizedProvincesModel.fromJson(Map<String, dynamic> json) =>
      PersonalizedProvincesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? provinsiId;
  String? nama;
  String? url;

  Datum({
    this.provinsiId,
    this.nama,
    this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        provinsiId: json["provinsi_id"],
        nama: json["nama"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "provinsi_id": provinsiId,
        "nama": nama,
        "url": url,
      };
}
