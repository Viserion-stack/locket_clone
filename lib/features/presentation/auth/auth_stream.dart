import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/landing_screen.dart';
import 'package:locket_clone/features/presentation/screens/login/loging_screen.dart';

import '../screens/home_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  _AuthGateState createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LandingScreen();
          }
        } else if (snapshot.hasError) {
          const Text('Error occured');
        }
        return const LandingScreen();
      },
    );
  }
}
