import 'package:day_habr_tutorial/data/api/request/get_day_body.dart';
import 'package:day_habr_tutorial/data/api/service/sunrise_service.dart';
import 'package:day_habr_tutorial/data/mapper/day_mapper.dart';
import 'package:day_habr_tutorial/domain/model/day.dart';
import 'package:meta/meta.dart';

class ApiUtil {
  final SunRiseService _sunRiseService;

  ApiUtil(this._sunRiseService);

  Future<Day> getDay(
      {@required double latitude, @required double longitude}) async {
    final body = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunRiseService.getDay(body);

    return DayMapper.fromApi(result);
  }
}
