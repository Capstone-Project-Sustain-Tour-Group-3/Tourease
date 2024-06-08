class RefreshTokenResponseModel {
  String? status;
  String? message;
  Data? data;

  RefreshTokenResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponseModel(
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
  String? accessToken;

  Data({
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}
