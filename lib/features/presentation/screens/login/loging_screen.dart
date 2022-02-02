import 'package:flutter/material.dart';
import 'package:locket_clone/features/data/datasources/remote/remote.dart';
import 'package:locket_clone/features/presentation/screens/login/bloc/login_bloc.dart';
import 'package:provider/src/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LoginFormWidget();
  }
}

class _LoginFormWidget extends StatelessWidget {
  RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
  _LoginFormWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _pasword = '';

  Future<void> _trySubmit() async {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
    }

    try {
      remoteDataSourceImpl.login(_email, _pasword);
    } catch (error) {
      //TODO error handle
    } finally {
      //TODO Do some after loging succefully or not
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email name';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _email = newValue!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: const ValueKey('Password'),
                    validator: (value) {
                      if (value!.length <= 8) {
                        return 'Password must be 9 characters long!';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _email = newValue!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      remoteDataSourceImpl.login(_email, _pasword);
                      // context
                      //     .read<LoginBloc>()
                      //     .add(LoginEvent.loginSubmit(_email, _pasword));
                    },
                    child: const Text(
                      'Login ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
