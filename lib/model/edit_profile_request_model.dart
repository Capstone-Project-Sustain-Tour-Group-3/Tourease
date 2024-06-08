class EditProfileRequestModel {
  String? username;
  String? namaLengkap;
  String? bio;
  String? email;
  String? noTelepon;
  String? jenisKelamin;
  String? kota;
  String? provinsi;

  EditProfileRequestModel({
    this.username,
    this.namaLengkap,
    this.bio,
    this.email,
    this.noTelepon,
    this.jenisKelamin,
    this.kota,
    this.provinsi,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'nama_lengkap': namaLengkap,
      'bio': bio,
      'email': email,
      'no_telepon': noTelepon,
      'jenis_kelamin': jenisKelamin,
      'kota': kota,
      'provinsi': provinsi,
    };
  }
}
