import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/Map-Screen';
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TextEditingController _searchController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 7,
  );
  String? _mapStyle;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .13,
            left: MediaQuery.of(context).size.width * .17,
            child: Text(
              'Find your home',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .2,
            left: MediaQuery.of(context).size.width * .05,
            //right: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              //color: Colors.amber,
              width: 350,
              height: 50,
              child: TextFormField(
                controller: _searchController,
                decoration: new InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search_outlined,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: 'What\'s your postalcode? '),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
