 import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> with WidgetsBindingObserver {

  late GoogleMapController _googleMapController;
  static const _initialCameraPosition =
  CameraPosition(target: LatLng(31.41922, 74.23002), zoom: 15);
  List<Marker> _marrkers = [];

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _marrkers.add(Marker(
        markerId: MarkerId('12'),
        position: LatLng(31.41922, 74.23002),
        infoWindow: InfoWindow(title: 'Cake Craft')));

    return Scaffold(
      appBar: AppBar(
        title: Text('Cake Craft'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            mapType: MapType.normal,
            markers: Set<Marker>.of(_marrkers)
          )
        ],
      ),
    );
  }
}