import 'package:dio/dio.dart';
import 'package:tourease/model/search_destinasi_response.dart';
import 'package:tourease/utils/base_url.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class DestinasiService {
  final Dio dio = Dio();

  Future<SearchDestinasiResponse> searchDestinasi({
    String? search,
    String? limit,
    String? page,
    String? sort,
    String? filter,
  }) async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.get(
      '${BaseUrl.urlAPI}/destinations?search=${search ?? ''}&limit=${limit ?? ''}&page=${page ?? ''}&sort=${sort ?? ''}&filter=${filter ?? ''}',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return SearchDestinasiResponse.fromJson(response.data);
  }
}
