import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String title;

  const MapScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    );

    final Marker marker = Marker(
      markerId: MarkerId(title),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: title),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF7cb2d6),
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: {marker},
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}