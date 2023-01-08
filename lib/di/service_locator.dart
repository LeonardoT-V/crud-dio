import 'package:dio/dio.dart';
import 'package:flutter_dio/data/network/api/user/user_api.dart';
import 'package:flutter_dio/data/network/dio_client.dart';
import 'package:flutter_dio/data/repository/user_repository.dart';
import 'package:flutter_dio/ui/home/controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));

  getIt.registerSingleton(HomeController());
}
