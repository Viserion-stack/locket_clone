import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:platform/platform.dart' show Platform;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../application/app_insets.dart';
import '../../widgets/drawer/drawer.dart';
import '../question/questions_screen.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/Map-Screen';
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(53.42796133580664, -2.085749655962),
    zoom: 7,
  );
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    // ignore: unrelated_type_equality_checks
    if (Platform.android == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
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
        elevation: 0.0,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Find your home',
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 15, right: 15),
            child: Align(
              alignment: Alignment.topCenter,
              //right: 20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                //color: Colors.amber,
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'What\'s your postalcode? '),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
