import 'package:flutter/material.dart';
import 'package:wonders/data/wonders.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WonderScreen extends StatefulWidget {
  const WonderScreen({Key? key}) : super(key: key);

  static const routeName = "/wonder-screen";

  @override
  State<WonderScreen> createState() => _WonderScreenState();
}

class _WonderScreenState extends State<WonderScreen> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    final WorldWonder wonder =
        ModalRoute.of(context)!.settings.arguments as WorldWonder;
    final LatLng _center = wonder.latLong;
    final marker = Marker(
      markerId: MarkerId(wonder.name),
      position: _center,
      infoWindow: InfoWindow(title: wonder.name, snippet: wonder.description),
    );

    setState(() {
      markers[MarkerId(wonder.name)] = marker;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(wonder.name),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 10.0,
        ),
        markers: markers.values.toSet(),
      ),
    );
  }
}
