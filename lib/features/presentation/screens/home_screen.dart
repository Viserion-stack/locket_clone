import 'package:flutter/material.dart';

import '../application/app_insets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      //         //Navigator.of(context).pushNamed(HomeScreen.);
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
                  //Navigator.of(context).pushNamed(HomeScreen.);
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
                'Hi, Viserion!',
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
                    color: Color(0xFFFFA142),
                    title: 'Get a quote',
                    subTitle: 'Check my pirce',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    tWidget: Expanded(
                      child: Container(
                        color: Colors.amber,
                        height: 200,
                        width: 100,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/images/rece.png',
                    //   fit: BoxFit.cover,
                    // ),
                    //lIcon: Icons.call,
                    color: Colors.white,
                    title: 'Refer a friend',
                    subTitle: 'Refer your firend... win great prizes!',
                    onTap: () {},
                  ),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    //lIcon: Icons.call,
                    color: Colors.white54,
                    title: 'Smart store',
                    subTitle: 'Get exclusive discounts tech ->',
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
  final Widget? tWidget;
  final VoidCallback? tIconCallBack;
  final VoidCallback? onTap;

  const _userListTile({
    this.subTitle,
    this.tWidget,
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
        trailing: tWidget == null
            ? IconButton(
                onPressed: tIconCallBack,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              )
            : tWidget,
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
