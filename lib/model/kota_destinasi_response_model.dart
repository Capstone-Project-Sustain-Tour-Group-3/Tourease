// To parse this JSON data, do
//
//     final kotaDestinasiResponseModel = kotaDestinasiResponseModelFromJson(jsonString);

import 'dart:convert';

KotaDestinasiResponseModel kotaDestinasiResponseModelFromJson(String str) =>
    KotaDestinasiResponseModel.fromJson(json.decode(str));

String kotaDestinasiResponseModelToJson(KotaDestinasiResponseModel data) =>
    json.encode(data.toJson());

class KotaDestinasiResponseModel {
  String? status;
  String? message;
  List<Datum>? data;

  KotaDestinasiResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory KotaDestinasiResponseModel.fromJson(Map<String, dynamic> json) =>
      KotaDestinasiResponseModel(
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
  String? id;
  String? namaDestinasi;
  String? namaJalan;
  String? kecamatan;
  String? kota;
  String? provinsi;

  Datum({
    this.id,
    this.namaDestinasi,
    this.namaJalan,
    this.kecamatan,
    this.kota,
    this.provinsi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        namaDestinasi: json["nama_destinasi"],
        namaJalan: json["nama_jalan"],
        kecamatan: json["kecamatan"],
        kota: json["kota"],
        provinsi: json["provinsi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_destinasi": namaDestinasi,
        "nama_jalan": namaJalan,
        "kecamatan": kecamatan,
        "kota": kota,
        "provinsi": provinsi,
      };
}
