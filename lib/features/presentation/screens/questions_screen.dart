// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

import '../application/app_insets.dart';

class QuestionsScreen extends StatefulWidget {
  static const routeName = '/Questions-screen';
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F1EB),
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Color(0xFFF3F1EB),
      //   title: Text(
      //     'Got a question?',
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       highlightColor: Colors.transparent,
      //       splashColor: Colors.transparent,
      //       icon: Icon(
      //         Icons.menu,
      //       ),
      //       iconSize: AppInsets.xxMedium,
      //       color: Colors.black,
      //       onPressed: () {
      //         //Navigator.of(context).pushNamed(QuestionsScreen.);
      //       },
      //     ),
      //   ],
      //   leading: IconButton(
      //     highlightColor: Colors.transparent,
      //     splashColor: Colors.transparent,
      //     icon: Icon(
      //       Icons.arrow_back,
      //     ),
      //     iconSize: AppInsets.xxMedium,
      //     color: Colors.black,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 150,
            elevation: 0.0,
            backgroundColor: Color(0xFFF3F1EB),
            // title: Text(
            //   'Got a question?',
            //   style: TextStyle(
            //     color: Colors.black,
            //   ),
            // ),
            actions: [
              IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(
                  Icons.menu,
                ),
                iconSize: AppInsets.xxMedium,
                color: Colors.black,
                onPressed: () {
                  //Navigator.of(context).pushNamed(QuestionsScreen.);
                },
              ),
            ],
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
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color(0xFFF3F1EB),
              ),
              centerTitle: true,
              title: Text(
                'Got a question?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  _userListTile(
                    lIcon: Icons.email,
                    color: Colors.white,
                    title: 'FAQ',
                    subTitle:
                        'Browse the knowledge base and read the most frequently asked questions.',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    //lIcon: Icons.call,
                    color: Colors.white,
                    title: 'Contact with us',
                    subTitle:
                        'Speak to our consultant and get your questions answered.',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    //lIcon: Icons.call,
                    color: Colors.white,
                    title: 'Leave a feedback',
                    subTitle: 'Tell us what\'s on your mind.',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    //lIcon: Icons.call,
                    color: Colors.white,
                    title: 'Licences',
                    subTitle: 'Show Application licences.',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    //lIcon: Icons.call,
                    color: Colors.white,
                    title: 'Complains',
                    subTitle: 'Tell us what went wrong.',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _userListTile extends StatelessWidget {
  final IconData? lIcon;
  final Color color;
  final String title;
  final String? subTitle;
  final IconData? tIcon;
  final VoidCallback? tIconCallBack;
  final VoidCallback? onTap;

  const _userListTile({
    this.subTitle,
    this.tIcon,
    this.tIconCallBack,
    this.onTap,
    Key? key,
    this.lIcon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        dense: true,
        title: Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        subtitle: subTitle == null
            ? null
            : Text(
                subTitle!,
                style: TextStyle(fontSize: 20),
              ),
        onTap: onTap,
        trailing: IconButton(
          onPressed: tIconCallBack,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _userTileHeightSpace extends StatelessWidget {
  final double height;
  const _userTileHeightSpace({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
