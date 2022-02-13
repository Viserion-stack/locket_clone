import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/landing_screen.dart';
import 'package:locket_clone/features/presentation/screens/login/loging_screen.dart';

import '../screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              print('MA DATA');
              // Navigator.canPop(context) ? Navigator.of(context).pop() : null;
              return const HomeScreen();
            } else {
              print('NIE MA DATA');
              return const LandingScreen();
            }
          } else if (snapshot.hasError) {
            const Text('Error occured');
          }
          return const LandingScreen();
        });
  }
}
