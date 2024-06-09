class ChangePasswordResponseModel {
  String? status;
  String? message;

  ChangePasswordResponseModel({
    this.status,
    this.message,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
