import 'package:day_habr_tutorial/data/api/api_util.dart';
import 'package:day_habr_tutorial/data/api/service/sunrise_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(SunRiseService());
    }
    return _apiUtil;
  }
}
