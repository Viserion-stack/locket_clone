// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locket_clone/features/data/datasources/remote/remote.dart';
import 'package:locket_clone/features/presentation/application/application.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locket_clone/features/presentation/screens/home/home_screen.dart';
import 'package:locket_clone/features/presentation/screens/question/questions_screen.dart';
import 'package:locket_clone/features/presentation/services/global_methods.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/Login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LoginFormWidget();
  }
}

// ignore: must_be_immutable
class _LoginFormWidget extends StatefulWidget {
  const _LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<_LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<_LoginFormWidget> {
  RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();

  final _formKey = GlobalKey<FormState>();

  // ignore: unused_field
  String _email = '';

  final GlobalMethods _globalMethods = GlobalMethods();

  // String _pasword = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _googleSingIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          var date = DateTime.now().toString();
          var parsedDate = DateTime.parse(date);
          var formattedDate =
              '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
          // ignore: unused_local_variable
          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user!.uid)
              .set({
            'id': authResult.user!.uid,
            'name': authResult.user!.displayName,
            'email': authResult.user!.email,
            'phoneNumber': authResult.user!.phoneNumber,
            'imageUrl': authResult.user!.photoURL,
            'joinedDate': formattedDate,
            //'createdAt': Timestamp.now(),
          });

          Navigator.of(context).pushNamed(HomeScreen.routeName);
        } catch (error) {
          _globalMethods.authDialog(context, error.toString());
        } finally {
          //print('Logged');
        }
      }
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
            iconSize: AppInsets.xxMedium,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushNamed(QuestionsScreen.routeName);
            },
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
          child: SingleChildScrollView(
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
                  function: _googleSingIn,
                  backgroundColorButton: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
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
                  child: SizedBox(
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
                  function: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  },
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
  final VoidCallback function;
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
        onPressed: function,
        child: child,
      ),
    );
  }
}
