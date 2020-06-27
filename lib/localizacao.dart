
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Localizacao extends StatefulWidget {
  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
   GoogleMapController mapController;

  final LatLng _center = const LatLng(-23.5489, -46.6388);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: const Text('Localização'),

          backgroundColor: Colors.black,
          // title: const Text(''),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.explore,
                color: Colors.grey[400],
              ),
              onPressed: () {
                //
              },
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                //_select(choices[1]);
              },
            ),
            SizedBox(
              width: 15,
            ),
          ]),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
          ),
    ));
  }
} 