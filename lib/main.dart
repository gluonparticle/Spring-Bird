import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'screens/loading_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/community_screen.dart';
import 'screens/waste_collection_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/camera': (context) => const CameraScreen(),
        '/explore': (context) => const ExploreNearbyScreen(),
        '/community': (context) => const CommunityScreen(),
        '/waste': (context) => const WasteCollectionScreen(),
      },
    );
  }
}

class ExploreNearbyScreen extends StatelessWidget {
  const ExploreNearbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Nearby'),

      ),
      body: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(19.07, 72.88), // Initial camera position near the specified coordinates
    zoom: 11,
  );

  final Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('marker1'),
      position: const LatLng(19.07, 72.88),
      infoWindow: const InfoWindow(
        title: 'Non-Sustainable',
        snippet: 'This location is non-sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('marker1'),
      position: const LatLng(19.09, 72.87),
      infoWindow: const InfoWindow(
        title: 'Non-Sustainable',
        snippet: 'This location is non-sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('marker2'),
      position: const LatLng(19.05, 72.92),
      infoWindow: const InfoWindow(
        title: 'Mildly Sustainable',
        snippet: 'This location is mildly sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: const MarkerId('marker3'),
      position: const LatLng(19.13, 72.84),
      infoWindow: const InfoWindow(
        title: 'Mildly Sustainable',
        snippet: 'This location is mildly sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: const MarkerId('marker4'),
      position: const LatLng(19.03, 72.95),
      infoWindow: const InfoWindow(
        title: 'Mildly Sustainable',
        snippet: 'This location is mildly sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: const MarkerId('marker5'),
      position: const LatLng(19.15, 72.88),
      infoWindow: const InfoWindow(
        title: 'Sustainable',
        snippet: 'This location is sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId('marker6'),
      position: const LatLng(19.01, 72.93),
      infoWindow: const InfoWindow(
        title: 'Mildly Sustainable',
        snippet: 'This location is sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: const MarkerId('marker7'),
      position: const LatLng(19.17, 72.86),
      infoWindow: const InfoWindow(
        title: 'Non-Sustainable',
        snippet: 'This location is non-sustainable',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
      ),
    );
  }
}
