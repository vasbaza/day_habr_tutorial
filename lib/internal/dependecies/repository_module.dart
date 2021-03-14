import 'package:day_habr_tutorial/data/repository/day_data_repository.dart';
import 'package:day_habr_tutorial/domain/repository/day_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static DayRepository _dayRepository;

  static DayRepository dayRepository() {
    if (_dayRepository == null) {
      _dayRepository = DayDataRepository(ApiModule.apiUtil());
    }
    return _dayRepository;
  }
}
