// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locket_clone/features/data/datasources/remote/remote.dart';
import 'package:locket_clone/features/presentation/screens/login/bloc/login_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/Login-screen';
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
      backgroundColor: Color(0xFFF3F1EB),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF3F1EB),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.help_outline,
            ),
            iconSize: 30,
            color: Colors.black,
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
          ),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sing In',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.95,
              ),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.2,
                    primary: Colors.white,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/images/googleIcon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.2,
                    primary: Colors.white,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.apple,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with Apple',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Or use your email address ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 70,
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextFormField(
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
                    cursorWidth: 0.0,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Email Addres',
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      //prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFA142),
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    // remoteDataSourceImpl.login(_email, _pasword);
                    // context
                    //     .read<LoginBloc>()
                    //     .add(LoginEvent.loginSubmit(_email, _pasword));
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
