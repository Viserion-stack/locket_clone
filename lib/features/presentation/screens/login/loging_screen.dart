// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locket_clone/features/data/datasources/remote/remote.dart';
import 'package:locket_clone/features/presentation/application/application.dart';
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
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.themeData.appBarTheme.backgroundColor,
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.help_outline,
            ),
            iconSize: AppInsets.xxMedium,
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
          iconSize: AppInsets.xxMedium,
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
                height: AppInsets.xMedium,
              ),
              Text(
                'Sing In',
                style: TextStyle(fontSize: AppInsets.mLarge),
              ),
              SizedBox(
                height: AppInsets.xxxLarge,
                width: context.screenSize.width * 0.95,
              ),
              LoginScreenButton(
                function: () {},
                backgroundColorButton: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppInsets.xxMedium,
                      height: AppInsets.xxMedium,
                      child: Image.asset(
                        'assets/images/googleIcon.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: AppInsets.small,
                    ),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: AppInsets.xMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppInsets.mxMedium,
              ),
              LoginScreenButton(
                function: () {},
                backgroundColorButton: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppInsets.xxMedium,
                      right: AppInsets.xxMedium,
                      top: 20,
                      bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                        size: AppInsets.xxMedium,
                      ),
                      SizedBox(
                        width: AppInsets.small,
                      ),
                      Text(
                        'Sign in with Apple',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: AppInsets.xMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppInsets.xxmLarge,
              ),
              Text(
                'Or use your email address ',
                style: TextStyle(fontSize: AppInsets.xMedium),
              ),
              SizedBox(
                height: AppInsets.xxmLarge,
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: AppInsets.xxxLarge,
                  width: context.screenSize.width * 0.95,
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
                        borderRadius: BorderRadius.circular(AppInsets.mSmall),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppInsets.mSmall),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      //prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppInsets.xMedium,
              ),
              LoginScreenButton(
                function: () {},
                backgroundColorButton: Color(0xFFFFA142),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppInsets.xMedium,
                    fontWeight: FontWeight.w700,
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

class LoginScreenButton extends StatelessWidget {
  const LoginScreenButton({
    Key? key,
    required this.function,
    required this.backgroundColorButton,
    required this.child,
  }) : super(key: key);
  final Function function;
  final Color backgroundColorButton;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppInsets.xxxxLarge,
      width: context.screenSize.width * 0.95,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.2,
          primary: backgroundColorButton,
          onPrimary: Colors.white,
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: AppInsets.mLarge,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppInsets.small)),
        ),
        onPressed: () {},
        child: child,
      ),
    );
  }
}
