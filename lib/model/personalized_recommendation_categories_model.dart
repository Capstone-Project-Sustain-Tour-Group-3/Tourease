class PersonalizedCategoriesModel {
    String? status;
    String? message;
    List<Data>? data;

    PersonalizedCategoriesModel({
        this.status,
        this.message,
        this.data,
    });

    factory PersonalizedCategoriesModel.fromJson(Map<String, dynamic> json) => PersonalizedCategoriesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Data {
    String? id;
    String? nama;
    String? url;

    Data({
        this.id,
        this.nama,
        this.url,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url": url,
    };
}