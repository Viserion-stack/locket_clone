import 'package:get_it/get_it.dart';
import 'package:locket_clone/features/data/datasources/remote/remote.dart';
import 'package:locket_clone/features/data/repositories/login_repository.dart';
import 'package:locket_clone/features/domain/services/login.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl
    ..registerLazySingleton(() => LoginService(sl()))
    ..registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()))
    ..registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
