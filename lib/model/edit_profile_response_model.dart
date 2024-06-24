class EditProfileResponseModel {
  String? status;
  String? message;

  EditProfileResponseModel({
    this.status,
    this.message,
  });

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      EditProfileResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
