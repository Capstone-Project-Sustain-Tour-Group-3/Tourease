class DetailSavedRouteResponse {
    String? status;
    String? message;
    Data? data;

    DetailSavedRouteResponse({
        this.status,
        this.message,
        this.data,
    });

    factory DetailSavedRouteResponse.fromJson(Map<String, dynamic> json) => DetailSavedRouteResponse(
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
    String? namaRute;
    String? lokasiAwal;
    List<Destinasi>? destinasi;
    int? estimasiBiaya;

    Data({
        this.namaRute,
        this.lokasiAwal,
        this.destinasi,
        this.estimasiBiaya,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaRute: json["nama_rute"],
        lokasiAwal: json["lokasi_awal"],
        destinasi: json["destinasi"] == null ? [] : List<Destinasi>.from(json["destinasi"]!.map((x) => Destinasi.fromJson(x))),
        estimasiBiaya: json["estimasi_biaya"],
    );

    Map<String, dynamic> toJson() => {
        "nama_rute": namaRute,
        "lokasi_awal": lokasiAwal,
        "destinasi": destinasi == null ? [] : List<dynamic>.from(destinasi!.map((x) => x.toJson())),
        "estimasi_biaya": estimasiBiaya,
    };
}

class Destinasi {
    String? id;
    String? namaDestinasi;
    String? urlMedia;
    String? waktuKunjungan;
    String? waktuSelesaiKunjungan;
    int? biaya;

    Destinasi({
        this.id,
        this.namaDestinasi,
        this.urlMedia,
        this.waktuKunjungan,
        this.waktuSelesaiKunjungan,
        this.biaya,
    });

    factory Destinasi.fromJson(Map<String, dynamic> json) => Destinasi(
        id: json["id"],
        namaDestinasi: json["nama_destinasi"],
        urlMedia: json["url_media"],
        waktuKunjungan: json["waktu_kunjungan"],
        waktuSelesaiKunjungan: json["waktu_selesai_kunjungan"],
        biaya: json["biaya"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_destinasi": namaDestinasi,
        "url_media": urlMedia,
        "waktu_kunjungan": waktuKunjungan,
        "waktu_selesai_kunjungan": waktuSelesaiKunjungan,
        "biaya": biaya,
    };
}
