import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/screens/home_screen.dart';
import 'package:locket_clone/features/presentation/screens/landing_screen.dart';
import 'package:locket_clone/features/presentation/screens/my_profile/my_profile_screen.dart';
import 'package:locket_clone/features/presentation/screens/questions_screen.dart';

import '../aboutLocket.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var userToDisplay = user!.displayName!.split(' ');
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff162222)),
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userToDisplay[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      userToDisplay[1],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      user.email.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 10),
          ListTileItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xFFFFA142),
              size: 30,
            ),
            text: 'Home',
            callback: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTileItem(
            icon: Icon(
              Icons.person_outline,
              color: Color(0xFFFFA142),
              size: 30,
            ),
            text: 'My profile',
            callback: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(MyProfileScreen.routeName);
            },
          ),
          ListTileItem(
            icon: Icon(
              Icons.info_outline,
              color: Colors.grey,
              size: 30,
            ),
            text: 'About locket',
            callback: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AboutLocket.routeName,
                  arguments: 'https://locket.insure/about/');
            },
          ),
          ListTileItem(
            icon: Icon(
              Icons.privacy_tip_outlined,
              size: 30,
              color: Colors.grey,
            ),
            text: 'Privacy Policy',
            callback: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AboutLocket.routeName,
                  arguments: 'https://locket.insure/privacy/');
            },
          ),
          ListTileItem(
            icon: Icon(
              Icons.policy_outlined,
              color: Colors.grey,
              size: 30,
            ),
            text: 'Terms of Service',
            callback: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AboutLocket.routeName,
                  arguments: 'https://locket.insure/terms-of-service/');
            },
          ),
          ListTileItem(
            icon: Icon(
              Icons.help_outline,
              color: Colors.grey,
              size: 30,
            ),
            text: 'Help',
            callback: () {
              Navigator.of(context).pushNamed(QuestionsScreen.routeName);
            },
          ),
          SizedBox(
            height: 50,
          ),
          ListTileItem(
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.grey,
              size: 30,
            ),
            text: 'Log Out',
            callback: () {
              Navigator.of(context)
                  .pushReplacementNamed(LandingScreen.routeName);
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.callback,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onTap: callback,
      ),
    );
  }
}
