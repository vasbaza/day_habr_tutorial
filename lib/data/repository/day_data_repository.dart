import 'package:day_habr_tutorial/data/api/api_util.dart';
import 'package:day_habr_tutorial/domain/model/day.dart';
import 'package:day_habr_tutorial/domain/repository/day_repository.dart';
import 'package:flutter/cupertino.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  Future<Day> getDay(
      {@required double latitude, @required double longitude}) async {
    return _apiUtil.getDay(latitude: latitude, longitude: longitude);
  }
}
