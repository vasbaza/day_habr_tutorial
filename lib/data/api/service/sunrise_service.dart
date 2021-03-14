import 'package:day_habr_tutorial/data/api/api_day.dart';
import 'package:day_habr_tutorial/data/api/request/get_day_body.dart';
import 'package:dio/dio.dart';

class SunRiseService {
  static const _BASE_URL = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiDay> getDay(GetDayBody body) async {
    final response = await _dio.get(
      '/json',
      queryParameters: body.toApi(),
    );
    // print(response.data)
    return ApiDay.fromApi(response.data);
  }
}
