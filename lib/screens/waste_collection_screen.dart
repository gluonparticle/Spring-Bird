import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WasteCollectionScreen extends StatelessWidget {
  const WasteCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05 * 2,
            color: Colors.green.withOpacity(1), // Decrease opacity to 50%
          ),
          SizedBox(height: 10), // Add spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Transform.translate(
                  offset: Offset(0, -60), // Adjust the vertical offset here
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
                SizedBox(width: 48), // Add spacing for logo alignment
              ],
            ),
          ),
          SizedBox(height: 10), // Add spacing
          _buildButton(
            context,
            'Find Recycling Service Providers Near You!',
            Color(0x89E253).withOpacity(0.5), // Decrease opacity to 50%
          ),
          SizedBox(height: 10), // Add spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the search button
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0), // Indent the icon
                    child: Icon(Icons.search, color: Colors.black, size: 36), // Increase icon size
                  ),
                  label: Text('Search Nearby ...'),
                ),
              ),
            ),
          ),
          SizedBox(height: 10), // Add spacing
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: MapScreen(), // Integrate the Google Maps widget here
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color color) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: () {
          // Add functionality for the button
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          alignment: Alignment.center, // Center align text
        ),
        child: Text(
          text,
          textAlign: TextAlign.center, // Center align text
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 15,
      ),
      onMapCreated: (controller) {
        setState(() {
        });
      },
      markers: Set.from(_markers),
    );
  }
}
