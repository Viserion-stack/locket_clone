import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/question/questions_screen.dart';
import 'package:locket_clone/features/presentation/widgets/appbar/standard_appbar.dart';

import '../../widgets/drawer/drawer.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/MyProfile-Screen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var userToDisplay = user?.displayName!.split(' ');
    return Scaffold(
      endDrawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF3F1EB),
      key: _scaffoldKey,
      appBar: StandardAppbar(
        onHelp: () =>
            Navigator.of(context).pushNamed(QuestionsScreen.routeName),
        onMenu: () => _scaffoldKey.currentState!.openEndDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
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
                      subTitle: userToDisplay == null
                          ? 'First name'
                          : userToDisplay[0],
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    _ColumnItem(
                      title: 'Last Name',
                      subTitle: userToDisplay == null
                          ? 'Last name'
                          : userToDisplay[1],
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    _ColumnItem(
                      title: 'Email',
                      subTitle: user == null ? 'email' : user.email.toString(),
                    ),
                    const SizedBox(
                      height: 5,
                    )
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
              child: Text(
                title,
                style: const TextStyle(fontSize: 18),
              )),
          Text(
            subTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
