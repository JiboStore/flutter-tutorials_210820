import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/comments_model.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerLazySingleton<LoginModel>(() => LoginModel());

  locator.registerLazySingleton<HomeModel>(() {
    print('factory for HomeModel');
    return HomeModel();
  });

  locator.registerLazySingleton(() => CommentsModel());
}
