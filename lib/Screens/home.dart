import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController myController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
            specify['coordinate'].latitude, specify['coordinate'].longitude),
        infoWindow: InfoWindow(title: 'Area', snippet: specify['location']));
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    FirebaseFirestore.instance.collection('markers').get().then((myData) {
      if (myData.docs.isNotEmpty) {
        for (int i = 0; i < myData.docs.length; i++) {
          initMarker(myData.docs[i].data, myData.docs[i].id);
        }
      }
    });
  }

  void initState() {
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
          markerId: MarkerId('First Marker'),
          position: LatLng(23.0216238, 72.5797068),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'First Marker'),
        ),
      ].toSet();
    }

    return Scaffold(
      body: GoogleMap(
        markers: getMarker(),
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.0216238, 72.5797068),
          zoom: 16.0,
          tilt: 100.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          myController = controller;
        },
      ),
    );
  }
}
