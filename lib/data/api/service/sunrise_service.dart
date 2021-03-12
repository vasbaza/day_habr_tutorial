import 'package:day_habr_tutorial/data/api/api_day.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SunRiseService {
  static const _BASE_URL = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiDay> getDay(
      {@required double latitude, @required double longitude}) async {
    final query = {'lat': latitude, 'lng': longitude, 'formatted': 0};
    final response = await _dio.get(
      '/json',
      queryParameters: query,
    );
    return ApiDay.fromApi(response.data);
  }
}
