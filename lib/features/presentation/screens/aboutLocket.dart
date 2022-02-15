import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/questions_screen.dart';
import 'package:locket_clone/features/presentation/widgets/appbar/standard_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/drawer/drawer.dart';

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
      appBar: StandardAppbar(
        onHelp: () =>
            Navigator.of(context).pushNamed(QuestionsScreen.routeName),
        onMenu: () => _scaffoldKey.currentState!.openEndDrawer(),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
