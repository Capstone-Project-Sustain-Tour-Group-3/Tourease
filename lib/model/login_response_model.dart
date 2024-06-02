class LoginResponseModel {
  String? status;
  String? message;
  Data? data;

  LoginResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
  String? username;
  String? profileImage;
  String? accessToken;
  String? refreshToken;

  Data({
    this.username,
    this.profileImage,
    this.accessToken,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        profileImage: json["profile_image"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profile_image": profileImage,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
