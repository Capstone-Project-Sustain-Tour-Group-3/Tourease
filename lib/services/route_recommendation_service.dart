import 'package:dio/dio.dart';
import 'package:tourease/model/route_recommendation_cities_response.dart';
import 'package:tourease/model/route_request_model.dart';
import 'package:tourease/model/route_response_model.dart';
import 'package:tourease/model/save_route_request_model.dart';
import 'package:tourease/utils/base_url.dart';

class RouteRecommendationService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BaseUrl.urlAPI,
      headers: {
        'accept': 'application/json',
      },
    ),
  );

  Future<CityResponse> getCities(String token) async {
    try {
      final response = await _dio.get(
        '/destinations/cities',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return CityResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load cities with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load cities: $e');
    }
  }

  Future<RouteResponseModel> postRouteRecommendation(
      RouteRequestModel route) async {
    final response = await _dio.post(
      '/mobile/routes/summarize',
      data: route.toJson(),
    );
    return RouteResponseModel.fromJson(response.data);
  }

  Future<void> postSaveRoute(SaveRouteRequestModel saveRoute) async {
    final response = await _dio.post(
      '/mobile/routes/save',
      data: saveRoute.toJson(),
    );
    return response.data;
  }
}
