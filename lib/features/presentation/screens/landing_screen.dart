// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
            ),
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromRGBO(0, 0, 0, 200)),
          Positioned(
            top: MediaQuery.of(context).size.height * .35,
            left: MediaQuery.of(context).size.width * .15,
            child: Image.asset(
              'assets/images/icon.png',
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Center(
                child: Text(
                  'LOCKET',
                  style: TextStyle(
                      fontSize: 65, color: Colors.white, letterSpacing: 5),
                ),
              ),
              SizedBox(
                height: 450,
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
                onPressed: () {},
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
