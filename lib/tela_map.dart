import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:infoclin_913/Domain/Organizacao.dart';

class MapScreen extends StatefulWidget {
  final Organizations organization;

  const MapScreen({super.key, required this.organization});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? position;

  @override
  void initState() {
    super.initState();
    _convertAddress();
  }

  Future<void> _convertAddress() async {
    final address = "${widget.organization.address.city}, ${widget.organization.address.state}";

    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        setState(() {
          position = LatLng(locations.first.latitude, locations.first.longitude);
        });
      }
    } catch (e) {
      print("Erro ao geocodificar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.organization.name),
        backgroundColor: Colors.blue,
      ),
      body: position == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: position!,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("org"),
            position: position!,
            infoWindow: InfoWindow(
              title: widget.organization.name,
              snippet: widget.organization.specialties.join(", "),
            ),
          ),
        },
      ),
    );
  }
}