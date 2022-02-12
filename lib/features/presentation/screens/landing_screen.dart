// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/login/loging_screen.dart';

class LandingScreen extends StatefulWidget {
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
        if (animationStatus == AnimationStatus.completed) {
          // _animationController.reverse().then((value) {
          //_animationController.reverse();
          // });
        }
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
          Container(
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
            //top: MediaQuery.of(context).size.height * .35,
            //left: MediaQuery.of(context).size.width * .15,
            child: SizedBox(
              height: 100,
              width: 100,
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
                    fontSize: 65,
                    color: Colors.white,
                    letterSpacing: 5,
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
                    fontSize: 40,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 60.0, right: 60, top: 20, bottom: 20),
                  child: Text(
                    'CHECK MY PRICE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text(
                  'Log in ->',
                  style: TextStyle(
                    fontSize: 18,
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
