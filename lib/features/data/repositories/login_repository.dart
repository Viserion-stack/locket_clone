import 'package:locket_clone/features/data/datasources/remote/remote.dart';

abstract class LoginRepository {
  Future<void> login(String email, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);
  @override
  Future<void> login(String email, String password) async {
    remoteDataSource.login(email, password);
  }
}
