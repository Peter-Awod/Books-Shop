import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_implementation.dart';
import '../../features/search/data/repos/search_repo_implementation.dart';
import 'services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(getIt.get<ApiService>()),
  );
}
