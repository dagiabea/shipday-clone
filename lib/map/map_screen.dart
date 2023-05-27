import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

   @override
  void initState() {
    super.initState();
    
  }

  Set<Marker> markers = {
    
  };

  GoogleMapController? controller;
  //GoogleMapController? controller;
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(8.976449, 38.746754), zoom: 14);

  //Set<LatLng> locations = {const LatLng(8.976449, 38.746754)};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 1,
        ),
        markers: markers,
        onMapCreated: ((mapController) {
          setState(() {
            controller = mapController;
          });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          const lat = 8.976449;
          const lng = 38.746754;
          final title = markers
              .addLabelMarker(LabelMarker(
            label: "Label Marker",
            markerId: const MarkerId('Label Marker'),
            position: const LatLng(lat, lng),
            backgroundColor: Colors.green,
          ))
              .then(
            (value) {
              setState(() {});
            },
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
