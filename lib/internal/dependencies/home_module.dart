import 'package:day_habr_tutorial/domain/state/home/home_state.dart';
import 'package:day_habr_tutorial/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.dayRepository(),
    );
  }
}
