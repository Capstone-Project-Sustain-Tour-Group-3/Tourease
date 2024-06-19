class SaveRouteRequestModel {
  String? cityId;
  String? name;
  String? startLocation;
  double? startLongitude;
  double? startLatitude;
  int? price;
  List<RouteDetail>? routeDetails;

  SaveRouteRequestModel({
    this.cityId,
    this.name,
    this.startLocation,
    this.startLongitude,
    this.startLatitude,
    this.price,
    this.routeDetails,
  });

  factory SaveRouteRequestModel.fromJson(Map<String, dynamic> json) =>
      SaveRouteRequestModel(
        cityId: json["city_id"],
        name: json["name"],
        startLocation: json["start_location"],
        startLongitude: json["start_longitude"]?.toDouble(),
        startLatitude: json["start_latitude"]?.toDouble(),
        price: json["price"],
        routeDetails: json["route_details"] == null
            ? []
            : List<RouteDetail>.from(
                json["route_details"]!.map((x) => RouteDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "name": name,
        "start_location": startLocation,
        "start_longitude": startLongitude,
        "start_latitude": startLatitude,
        "price": price,
        "route_details": routeDetails == null
            ? []
            : List<dynamic>.from(routeDetails!.map((x) => x.toJson())),
      };
}

class RouteDetail {
  String? destinationId;
  double? longitude;
  double? latitude;
  int? duration;
  int? order;
  String? visitStart;
  String? visitEnd;

  RouteDetail({
    this.destinationId,
    this.longitude,
    this.latitude,
    this.duration,
    this.order,
    this.visitStart,
    this.visitEnd,
  });

  factory RouteDetail.fromJson(Map<String, dynamic> json) => RouteDetail(
        destinationId: json["destination_id"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        duration: json["duration"],
        order: json["order"],
        visitStart: json["visit_start"],
        visitEnd: json["visit_end"],
      );

  Map<String, dynamic> toJson() => {
        "destination_id": destinationId,
        "longitude": longitude,
        "latitude": latitude,
        "duration": duration,
        "order": order,
        "visit_start": visitStart,
        "visit_end": visitEnd,
      };
}
