import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/application.dart';
import 'package:locket_clone/features/presentation/screens/questions_screen.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/MyProfile-Screen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F1EB),
      key: _scaffoldKey,
      appBar: AppBar(
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
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Color(0xFFF3F1EB),
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
              //Scaffold.of(context).openEndDrawer();
              //Navigator.of(context).pushNamed(HomeScreen.);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Account details',
                style: TextStyle(fontSize: 33),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _ColumnItem(
                      title: 'First name',
                      subTitle: 'Viserion',
                    ),
                    Divider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    _ColumnItem(
                      title: 'Last Name',
                      subTitle: 'Viserion',
                    ),
                    Divider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    _ColumnItem(
                      title: 'Email',
                      subTitle: 'vaiserion.93@gmail.com',
                    ),
                    SizedBox(height: 5,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ColumnItem extends StatelessWidget {
  const _ColumnItem({Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(title, style: TextStyle(fontSize: 18),)),
          Text(
            subTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          
        ],
      ),
    );
  }
}
