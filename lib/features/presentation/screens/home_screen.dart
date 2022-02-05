import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/application.dart';
import 'package:locket_clone/features/presentation/screens/drawer/drawer.dart';
import 'package:locket_clone/features/presentation/screens/questions_screen.dart';
import '../application/app_insets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF3F1EB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            stretch: true,
            expandedHeight: 150,
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
                  debugPrint('elo elo');

                  _scaffoldKey.currentState!.openEndDrawer();
                  //Scaffold.of(context).openEndDrawer();
                  //Navigator.of(context).pushNamed(HomeScreen.);
                },
              ),
            ],
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
                    imagePath: 'assets/images/rece.png',
                    tWidget: SizedBox(),
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
                    tWidget: SizedBox(),
                    imagePath: 'assets/images/iPod.png',
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
  final String? imagePath;

  const _userListTile({
    this.subTitle,
    this.tWidget,
    this.tIconCallBack,
    this.onTap,
    Key? key,
    this.lIcon,
    required this.color,
    required this.title,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0.0,
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
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
              : SizedBox(
                  width: 60,
                  height: 100,
                ),
        ),
      ),
      tWidget != null
          ? Positioned(
              top: context.screenSize.height * .029,
              right: context.screenSize.width * .03,
              child: SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.contain,
                  )),
            )
          : SizedBox(
              width: 100,
              height: 100,
            )
    ]);
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
