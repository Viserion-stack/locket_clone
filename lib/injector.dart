import 'package:get_it/get_it.dart';
import 'package:locket_clone/features/data/datasources/remote/remote.dart';
import 'package:locket_clone/features/data/repositories/login_repository.dart';
import 'package:locket_clone/features/domain/services/login.dart';
import 'package:locket_clone/features/presentation/screens/feedback/bloc/feedback_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl
    ..registerFactory(
      () => FeedbackBloc(),
    )
    ..registerLazySingleton(() => LoginService(sl()))
    ..registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        sl(),
      ),
    )
    ..registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(),
    );
}
