import 'dart:async';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';


class Menuclinicas extends StatefulWidget {
 const Menuclinicas({Key? key}) : super(key: key);

  @override
  _MenuclinicasState createState() => _MenuclinicasState();
  }


  class _MenuclinicasState extends State<Menuclinicas> {

   final _initialCameraPosition = CameraPosition(target: LatLng(0, 0));


   @override
   Widget build(BuildContext context) {
    return Scaffold(
     body: GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      myLocationEnabled: true,
     ),
    );
   }
}
