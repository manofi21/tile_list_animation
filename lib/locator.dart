import 'package:animation_tile_list_practice/remote_data_source/random_people_remote_data_source.dart';
import 'package:get_it/get_it.dart';

import 'repository/random_people_repository.dart';
import 'use_cases/random_people_use_case.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<RandomPeopleRemoteDataSource>(
      RandomPeopleRemoteDataSourceImpl());
 
  getIt.registerLazySingleton<RandomPeopleRepository>(
      () => RandomPeopleRepository(getIt.get<RandomPeopleRemoteDataSource>()));

  getIt.registerLazySingleton<RandomPeopleUseCase>(
      () => RandomPeopleUseCase(getIt<RandomPeopleRepository>()));
}
