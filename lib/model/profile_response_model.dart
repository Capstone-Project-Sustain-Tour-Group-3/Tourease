
class ProfileResponseModel {
    String? status;
    String? message;
    Data? data;

    ProfileResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
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
    String? id;
    String? username;
    String? namaLengkap;
    String? bio;
    String? email;
    String? noTelepon;
    String? fotoProfil;
    String? jenisKelamin;
    String? kota;
    String? provinsi;

    Data({
        this.id,
        this.username,
        this.namaLengkap,
        this.bio,
        this.email,
        this.noTelepon,
        this.fotoProfil,
        this.jenisKelamin,
        this.kota,
        this.provinsi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        namaLengkap: json["nama_lengkap"],
        bio: json["bio"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        fotoProfil: json["foto_profil"],
        jenisKelamin: json["jenis_kelamin"],
        kota: json["kota"],
        provinsi: json["provinsi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama_lengkap": namaLengkap,
        "bio": bio,
        "email": email,
        "no_telepon": noTelepon,
        "foto_profil": fotoProfil,
        "jenis_kelamin": jenisKelamin,
        "kota": kota,
        "provinsi": provinsi,
    };
}
