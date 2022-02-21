// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:locket_clone/features/presentation/screens/landing_screen.dart';
import 'package:locket_clone/features/presentation/screens/questions_screen.dart';
import 'package:locket_clone/features/presentation/widgets/appbar/standard_appbar.dart';

import '../../widgets/drawer/drawer.dart';

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
  _MyBodyWidget(
    value: 3,
    color: Colors.black87,
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
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController? controller;
  Animation<double>? annimation;
  AnimationController? controller1;
  Animation<double>? annimation1;

  List<String> introImages = [
    'assets/images/introImage1.jpeg',
    'assets/images/introImage2.jpeg',
    'assets/images/introImage3.jpeg',
  ];
  List<String> introTextHeader = [
    'SMARTER HOME MEANS SAFER HOME.',
    'SMART STORE WITH GREAT PRICES.',
    'SWITCH TO LOCKET NOW - WE\'LL COVER THE COST.',
  ];
  List<String> introParagraph = [
    'Locket recognises this and rewards you with great value insurance for looking  after your home.',
    'No smart tech? No Problem. You can still get Locket. And once you\'re a member, you can buy cool tech at amazing prices from a members-only smart store. ',
    'If your old insuner changes cancellation fees, we\'ll pay you right back up to £250 in Amazon vouchers.',
  ];

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    annimation = Tween(begin: 0.0, end: 1.0).animate(
      controller!,
    )..addListener(() {
        setState(() {});
      });
    controller!.forward();
    //print(widget.value);
    if (widget.value == 3.0) {
      controller1 = AnimationController(
          duration: const Duration(seconds: 5), vsync: this);
      annimation1 =
          CurvedAnimation(parent: controller1!, curve: Curves.easeInOutBack);

      controller1!.forward();
    }

    //_buttonController!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
    if (widget.value == 3.0) {
      controller1!.dispose();
    }
    //_buttonController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentImage = (widget.value.toInt() - 1);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const AppDrawer(),
      backgroundColor: widget.color,
      appBar: StandardAppbar(
        onMenu: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
        onHelp: () {
          Navigator.of(context).pushNamed(QuestionsScreen.routeName);
        },
        backgroundColor: widget.value == 3.0 ? Color(0xFF20201F) : widget.color,
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
              introTextHeader[currentImage],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 39,
                color: widget.value == 3 ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              introParagraph[currentImage],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: widget.value == 3 ? Colors.white : Colors.black,
              ),
            ),
            currentImage == 2
                ? FadeTransition(
                    opacity: annimation1!,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: ElevatedButton(
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
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(LandingScreen.routeName);
                        },
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
                    ),
                  )
                : SizedBox(),
          ],
        ),
      )),
    );
  }
}
