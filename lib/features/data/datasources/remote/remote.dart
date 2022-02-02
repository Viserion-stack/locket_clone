import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<void> login(String email, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<void> login(String email, String password) {
    final _auth = FirebaseAuth.instance;
    _auth.signInWithEmailAndPassword(
        email: email.toLowerCase().trim(), password: password.trim());

    throw UnimplementedError();
  }
}
