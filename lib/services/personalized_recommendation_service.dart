import 'package:dio/dio.dart';
import 'package:tourease/model/personalized_recommendation_categories_model.dart';
import 'package:tourease/model/personalized_recommendation_provinces_model.dart';
import 'package:tourease/model/personalized_recommendation_selection_model.dart';
import 'package:tourease/utils/base_url.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class PersonalizedRecommendationService {
  final Dio dio = Dio();

  Future<PersonalizedCategoriesModel> getCategory() async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.get(
      '${BaseUrl.urlAPI}/personalization/categories',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return PersonalizedCategoriesModel.fromJson(response.data);
  }

  Future<PersonalizedProvincesModel> getProvincy() async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.get(
      '${BaseUrl.urlAPI}/personalization/provinces',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return PersonalizedProvincesModel.fromJson(response.data);
  }

  Future<void> postPersonalization(PersonalizedSelectionModel data) async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.post(
      '${BaseUrl.urlAPI}/personalization',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
      data: data.toJson(),
    );
    return response.data;
  }
}
