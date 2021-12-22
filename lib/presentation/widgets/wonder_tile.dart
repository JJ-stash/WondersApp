import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WonderTile extends StatelessWidget {
  const WonderTile(
      {Key? key,
      required this.name,
      required this.description,
      required this.latLong})
      : super(key: key);

  final String name;
  final String description;
  final LatLng latLong;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
      ),
    );
  }
}
