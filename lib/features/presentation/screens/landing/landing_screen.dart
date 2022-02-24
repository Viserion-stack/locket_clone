// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/application.dart';
import 'package:locket_clone/features/presentation/screens/introduction/introduction_screen.dart';
import 'package:locket_clone/features/presentation/screens/login/loging_screen.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = 'Landing-Screen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {}
      });
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/landing.jpg',
              fit: BoxFit.cover,
              alignment: FractionalOffset(_animation.value, 0),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 120),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: AppInsets.xxxxmLarge,
              width: AppInsets.xxxxmLarge,
              child: Image.asset(
                'assets/images/Icon.png',
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Center(
                child: Text(
                  'LOCKET',
                  style: TextStyle(
                    fontSize: AppInsets.xxxxLarge,
                    color: Colors.white,
                    letterSpacing: AppInsets.xSmall,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .35,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFA142),
                  onPrimary: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: AppInsets.mLarge,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppInsets.small)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CheckMyPriceScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppInsets.xxxLarge,
                      right: AppInsets.xxxLarge,
                      top: AppInsets.xMedium,
                      bottom: AppInsets.xMedium),
                  child: Text(
                    'CHECK MY PRICE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppInsets.xMedium,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Arleady have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppInsets.xmMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                child: Text(
                  'Log in ->',
                  style: TextStyle(
                    fontSize: AppInsets.xmMedium,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
