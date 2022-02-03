import 'package:locket_clone/features/data/repositories/login_repository.dart';

class LoginService {
  final LoginRepository loginRepository;

  LoginService(this.loginRepository);

  Future<void> loginService(String email, String password) async {
    return loginRepository.login(email, password);
  }
}
