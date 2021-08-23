import 'package:get_it/get_it.dart';
import 'package:scoped_guide/scoped_model/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services

  // Register model
  locator.registerFactory<HomeModel>(() => HomeModel());
}
