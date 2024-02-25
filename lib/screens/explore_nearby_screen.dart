import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  final LatLng _initialPosition = const LatLng(19.070315, 72.877795);

  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(19.068159, 72.875950),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: 'Non-Sustainable'),
    ),
    Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(19.068837, 72.876248),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: 'Mildly Sustainable'),
    ),
    Marker(
      markerId: MarkerId('marker3'),
      position: LatLng(19.069486, 72.875117),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: 'Mildly Sustainable'),
    ),
    Marker(
      markerId: MarkerId('marker4'),
      position: LatLng(19.070315, 72.877795),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: 'Mildly Sustainable'),
    ),
    Marker(
      markerId: MarkerId('marker5'),
      position: LatLng(19.070313, 72.877648),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: 'Sustainable'),
    ),
    Marker(
      markerId: MarkerId('marker6'),
      position: LatLng(19.070434, 72.877009),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: 'Mildly Sustainable'),
    ),
    Marker(
      markerId: MarkerId('marker7'),
      position: LatLng(19.070633, 72.876565),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: 'Non-Sustainable'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: Set.from(_markers),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
