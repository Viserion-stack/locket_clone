// ignore_for_file: unused_field, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:locket_clone/features/presentation/application/application.dart';
import 'package:locket_clone/features/presentation/widgets/drawer/drawer.dart';
import 'package:locket_clone/features/presentation/screens/question/questions_screen.dart';

import '../login/loging_screen.dart';
import '../map/maps_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      endDrawer: const AppDrawer(),
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF3F1EB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            stretch: true,
            expandedHeight: 150,
            elevation: 0.0,
            backgroundColor: context.themeData.appBarTheme
                .backgroundColor, //const Color(0xFFF3F1EB),
            actions: [
              IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(
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
                icon: const Icon(
                  Icons.menu,
                ),
                iconSize: AppInsets.xxMedium,
                color: Colors.black,
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFFF3F1EB),
              ),
              centerTitle: false,
              title: Text(
                user == null
                    ? 'Hi Friend!'
                    : 'Hi, ${user.displayName.toString()}!',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  _userListTile(
                    lIcon: Icons.email,
                    color: const Color(0xFFFFA142),
                    title: 'Get a quote',
                    subTitle: 'Check my pirce',
                    onTap: () {
                      Navigator.of(context).pushNamed(MapScreen.routeName);
                    },
                  ),
                  const ReferCard(),
                  const _userTileHeightSpace(height: 10),
                  _userListTile(
                    tWidget: const SizedBox(),
                    imagePath: 'assets/images/iPod.png',
                    color: Colors.white54,
                    title: 'Smart store',
                    subTitle: 'Get exclusive discounts tech ->',
                    onTap: () {},
                  ),
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
          borderRadius: BorderRadius.circular(AppInsets.medium),
        ),
        elevation: 0.0,
        child: ListTile(
          contentPadding: const EdgeInsets.only(
              left: AppInsets.xMedium,
              top: AppInsets.xMedium,
              bottom: AppInsets.medium),
          dense: true,
          title: Text(
            title,
            style: const TextStyle(
                fontSize: AppInsets.mmMedium, fontWeight: FontWeight.bold),
          ),
          subtitle: subTitle == null
              ? null
              : Text(
                  subTitle!,
                  style: const TextStyle(fontSize: AppInsets.xmMedium),
                ),
          onTap: onTap,
          trailing: tWidget == null
              ? IconButton(
                  onPressed: tIconCallBack,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: AppInsets.xmMedium,
                  ),
                )
              : const SizedBox(
                  width: AppInsets.xxxLarge,
                  height: AppInsets.xxxxmLarge,
                ),
        ),
      ),
      tWidget != null
          ? Positioned(
              top: context.screenSize.height * .01,
              right: context.screenSize.width * .008,
              child: SizedBox(
                  height: AppInsets.xxxmmLarge,
                  width: AppInsets.xxxxmLarge,
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.contain,
                  )),
            )
          : const SizedBox(
              width: AppInsets.xxxxmLarge,
              height: AppInsets.xxxxmLarge,
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

class ReferCard extends StatefulWidget {
  const ReferCard({Key? key}) : super(key: key);

  @override
  _ReferCardState createState() => _ReferCardState();
}

class _ReferCardState extends State<ReferCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: isExpanded ? 455 : 170,
        // height: _heightAnimation.value.height,
        constraints: BoxConstraints(minHeight: isExpanded ? 455 : 170),
        width: context.screenSize.width * 0.75,
        padding: const EdgeInsets.only(
            left: AppInsets.sMedium,
            right: AppInsets.sMedium,
            bottom: AppInsets.xSmall),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(children: [
            Column(
              children: <Widget>[
                const SizedBox(
                  height: AppInsets.xmMedium,
                ),
                Stack(children: [
                  _userListTile(
                    imagePath: 'assets/images/rece.png',
                    tWidget: const SizedBox(),
                    color: Colors.white,
                    title: 'Refer a friend',
                    subTitle: 'Refer your firend... win great prizes!',
                    onTap: () {},
                  ),
                ]),
                isExpanded
                    ? const SizedBox(
                        height: 1,
                        child: Divider(
                          thickness: 1,
                          indent: AppInsets.medium,
                          endIndent: AppInsets.medium,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey,
                          size: AppInsets.xxMedium,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(AppInsets.mxSmall),
                  child: Column(
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppInsets.medium),
                        child: Text(
                          'Invite your friend to Locket and you\'ll get a mystery prize 60 days from their policy start date.',
                          style: TextStyle(
                              fontSize: AppInsets.medium, color: Colors.grey),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Text(
                        'vise8025.',
                        style: TextStyle(
                          fontSize: AppInsets.xxMedium,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Your referal code.',
                        style: TextStyle(
                            fontSize: AppInsets.sMedium, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                LoginScreenButton(
                  function: () {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  },
                  backgroundColorButton: const Color(0xFFFFA142),
                  child: const Text(
                    'TELL MY FRIENDS ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppInsets.xMedium,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const _userTileHeightSpace(
                  height: 22,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: LoginScreenButton(
                    function: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    },
                    backgroundColorButton: Colors.white,
                    child: const Text(
                      'SEE MY REWARDS',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: AppInsets.xMedium,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                !isExpanded
                    ? const SizedBox(
                        height: AppInsets.small,
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Colors.grey,
                          size: AppInsets.large,
                        ),
                      ),
                const SizedBox(
                  height: AppInsets.xmMedium,
                ),
              ],
            ),
            Positioned(
              top: context.screenSize.height * 0.01,
              left: context.screenSize.width * 0.05,
              child: SizedBox(
                  height: AppInsets.large,
                  width: AppInsets.large,
                  child: Image.asset(
                    'assets/images/messageIcon.png',
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
