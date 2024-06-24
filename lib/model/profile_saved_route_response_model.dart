class SavedRouteProfileResponse {
  String? status;
  String? message;
  List<DataRoute>? data;

  SavedRouteProfileResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SavedRouteProfileResponse.fromJson(Map<String, dynamic> json) =>
      SavedRouteProfileResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataRoute>.from(
                json["data"]!.map((x) => DataRoute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataRoute {
  String? id;
  String? namaRute;
  int? biaya;

  DataRoute({
    this.id,
    this.namaRute,
    this.biaya,
  });

  factory DataRoute.fromJson(Map<String, dynamic> json) => DataRoute(
        id: json["id"],
        namaRute: json["nama_rute"],
        biaya: json["biaya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_rute": namaRute,
        "biaya": biaya,
      };
}
