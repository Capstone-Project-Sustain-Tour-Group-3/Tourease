class SaveRouteResponseModel {
  String? status;
  String? message;

  SaveRouteResponseModel({
    this.status,
    this.message,
  });

  factory SaveRouteResponseModel.fromJson(Map<String, dynamic> json) => SaveRouteResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
