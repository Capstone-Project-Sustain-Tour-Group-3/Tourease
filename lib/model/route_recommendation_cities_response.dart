class CityResponse {
  final String status;
  final String message;
  final List<City> data;

  CityResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return CityResponse(
      status: json['status'],
      message: json['message'],
      data: List<City>.from(json['data'].map((x) => City.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class City {
  final String id;
  final String nama;

  City({
    required this.id,
    required this.nama,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      nama: json['nama'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
    };
  }
}
