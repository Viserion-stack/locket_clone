import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/questions_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../application/app_insets.dart';
import 'drawer/drawer.dart';

class AboutLocket extends StatefulWidget {
  static const routeName = 'About-locket';
  const AboutLocket({Key? key}) : super(key: key);

  @override
  State<AboutLocket> createState() => _AboutLocketState();
}

class _AboutLocketState extends State<AboutLocket> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      endDrawer: AppDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F1EB),
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
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.menu,
            ),
            iconSize: AppInsets.xxMedium,
            color: Colors.black,
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
