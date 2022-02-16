import 'dart:async';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:locket_clone/features/presentation/widgets/appbar/standard_appbar.dart';

class CheckMyPriceScreen extends StatefulWidget {
  static const routeName = '/CheckMyPrice-Screen';
  const CheckMyPriceScreen({Key? key}) : super(key: key);

  @override
  State<CheckMyPriceScreen> createState() => _CheckMyPriceScreenState();
}

final introKey = GlobalKey<IntroductionScreenState>();

final pagesList = <Widget>[
  const _MyBodyWidget(
    color: Colors.orangeAccent,
  ),
  const _MyBodyWidget(
    color: Colors.grey,
    appbarItemsColor: Colors.white,
  ),
  const _MyBodyWidget(
    color: Colors.teal,
    appbarItemsColor: Colors.white,
  ),
];

class _CheckMyPriceScreenState extends State<CheckMyPriceScreen> {
  @override
  PageController controller = PageController();
  int currentIndex = 0;
  void initState() {
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        controller.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = 2;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: pagesList,
        key: introKey,
      ),
    );
  }
}

class _MyBodyWidget extends StatelessWidget {
  const _MyBodyWidget({Key? key, required this.color, this.appbarItemsColor})
      : super(key: key);
  final Color color;
  final Color? appbarItemsColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: StandardAppbar(
        onMenu: () {},
        onHelp: () {},
        backgroundColor: color,
        appbarItemsColor: appbarItemsColor,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                'assets/images/girl_face.jpg',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'SMARTER HOME MEANS SAFER HOME.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Locket recognises this and rewards you with great value insurance for looking  after your home.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
      )),
    );
  }
}
