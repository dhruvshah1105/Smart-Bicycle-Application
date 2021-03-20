import 'dart:async';

import 'package:autoforest/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:autoforest/Services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key key, this.user}) : super(key: key);
  final UserCredential user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  Position currentposition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0.0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentposition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 15);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.639151, 69.612160),
    zoom: 15,
  );

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('SHC E-Bikes'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Text('Demo'),
              accountEmail: Text('demo@xyz.com'),
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controllerGoogleMap.complete(controller);
          newGoogleMapController = controller;

          setState(() {
            bottomPaddingOfMap = 5;
          });
          locatePosition();
        },
        markers: {area1Marker, area2Marker, area3Marker,area4Marker,area5Marker,area6Marker},
      ),
    );
  }
}

Marker area1Marker = Marker(
  onTap: () {},
  markerId: MarkerId('area1'),
  position: LatLng(23.003723, 72.5538743),
  infoWindow: InfoWindow(title: 'Anjali Cross Road, BRTS Station, Vasna, Ahmedabad, Ahmedabad - 380001, Gujarat, India'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker area2Marker = Marker(
  markerId: MarkerId('area2'),
  position: LatLng(23.0082114,72.5492824),
  infoWindow: InfoWindow(title: 'Dharnidhar, BRTS Station, Vasna, Ahmedabad, Ahmedabad - 380001, Gujarat, India'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker area3Marker = Marker(
  onTap: () {},
  markerId: MarkerId('area3'),
  position: LatLng(23.0155489,72.5591091),
  infoWindow: InfoWindow(title: 'Municipal School, Parimal Underbridge, Paldi, Ahmedabad - 380001, Gujarat, India'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker area4Marker = Marker(
  onTap: () {},
  markerId: MarkerId('area4'),
  position: LatLng(23.0223322,72.5428445),
  infoWindow: InfoWindow(title: 'Nehrunagar Circle, Panjrapole, Ahmedabad - 380001, Gujarat, India'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker area5Marker = Marker(
  markerId: MarkerId('area5'),
  position: LatLng(23.0153941,72.5292683),
  infoWindow: InfoWindow(title: 'Jodhpur, Ahmedabad - 380001, Gujarat, India'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker area6Marker = Marker(
  onTap: () {},
  markerId: MarkerId('area6'),
  position: LatLng(23.0243034,72.5312954),
  infoWindow: InfoWindow(title: 'Shivranjani, BRTS Station, Panjrapole, Ahmedabad - 380001, Gujarat, India'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);