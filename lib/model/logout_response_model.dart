class LogoutResponseModel {
  String? status;
  String? message;

  LogoutResponseModel({
    this.status,
    this.message,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      LogoutResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
