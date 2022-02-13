import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locket_clone/features/presentation/screens/aboutLocket.dart';
import 'package:locket_clone/features/presentation/screens/home_screen.dart';
import 'package:locket_clone/features/presentation/screens/landing_screen.dart';
import 'package:locket_clone/features/presentation/screens/login/bloc/login_bloc.dart';
import 'package:locket_clone/features/presentation/screens/login/loging_screen.dart';
import 'package:locket_clone/features/presentation/screens/map/maps_screen.dart';
import 'package:locket_clone/features/presentation/screens/my_profile/my_profile_screen.dart';

import 'features/presentation/auth/auth_stream.dart';
import 'features/presentation/screens/questions_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        QuestionsScreen.routeName: (ctx) => const QuestionsScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        MyProfileScreen.routeName: (ctx) => const MyProfileScreen(),
        MapScreen.routeName: (ctx) => const MapScreen(),
        AboutLocket.routeName: (ctx) => const AboutLocket(),
        LandingScreen.routeName: (ctx) => const LandingScreen(),
      },
      title: 'Locket clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: const AuthGate(),
    );
  }
}
