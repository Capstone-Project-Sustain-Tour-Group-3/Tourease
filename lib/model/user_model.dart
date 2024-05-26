class UserModel {
  String? username;
  String? namaLengkap;
  String? email;
  String? noTelepon;
  String? password;
  String? referenceId;

  UserModel({
    this.username,
    this.namaLengkap,
    this.email,
    this.noTelepon,
    this.password,
    this.referenceId,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'nama_lengkap': namaLengkap,
      'email': email,
      'no_telepon': noTelepon,
      'password': password,
      'reference_id': referenceId
    };
  }
}
