class PersonalizedSelectionModel {
    List<String>? idKategori;
    List<String>? idProvinsi;

    PersonalizedSelectionModel({
        this.idKategori,
        this.idProvinsi,
    });

    factory PersonalizedSelectionModel.fromJson(Map<String, dynamic> json) => PersonalizedSelectionModel(
        idKategori: json["id_kategori"] == null ? [] : List<String>.from(json["id_kategori"]!.map((x) => x)),
        idProvinsi: json["id_provinsi"] == null ? [] : List<String>.from(json["id_provinsi"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id_kategori": idKategori == null ? [] : List<dynamic>.from(idKategori!.map((x) => x)),
        "id_provinsi": idProvinsi == null ? [] : List<dynamic>.from(idProvinsi!.map((x) => x)),
    };
}
