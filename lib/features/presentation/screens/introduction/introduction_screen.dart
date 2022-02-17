// ignore_for_file: prefer_const_constructors

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
    value: 1,
  ),
  _MyBodyWidget(
    color: (Colors.grey.shade700),
    appbarItemsColor: Colors.white,
    value: 2,
  ),
  const _MyBodyWidget(
    value: 3,
    color: Colors.black,
    appbarItemsColor: Colors.white,
  ),
];

class _CheckMyPriceScreenState extends State<CheckMyPriceScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        controller.animateToPage(currentIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastOutSlowIn);
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

class _MyBodyWidget extends StatefulWidget {
  const _MyBodyWidget({
    Key? key,
    required this.color,
    this.appbarItemsColor,
    required this.value,
  }) : super(key: key);
  final Color color;
  final Color? appbarItemsColor;
  final double value;

  @override
  State<_MyBodyWidget> createState() => _MyBodyWidgetState();
}

class _MyBodyWidgetState extends State<_MyBodyWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? annimation;

  List<String> introImages = [
    'assets/images/introImage1.jpeg',
    'assets/images/introImage2.jpeg',
    'assets/images/introImage3.jpeg',
  ];

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    annimation = Tween(begin: 0.0, end: 1.0).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
    controller!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentImage = (widget.value.toInt() - 1);
    return Scaffold(
      backgroundColor: widget.color,
      appBar: StandardAppbar(
        onMenu: () {},
        onHelp: () {},
        backgroundColor: widget.color,
        appbarItemsColor: widget.appbarItemsColor,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: Row(
                children: [
                  Expanded(
                    // height: 100,
                    // width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        value: widget.value == 1 ? annimation!.value : 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        value: widget.value == 2
                            ? annimation!.value
                            : widget.value == 3
                                ? 1
                                : 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        value: widget.value == 3 ? annimation!.value : 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 100,
              backgroundImage: AssetImage(introImages[currentImage]),
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
                color: widget.value == 3 ? Colors.white : Colors.black,
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
                color: widget.value == 3 ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      )),
    );
  }
}
