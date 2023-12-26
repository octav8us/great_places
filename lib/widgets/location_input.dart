
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewLocationUrl;
Future<void> _getCurrentUserLocation() async {
final locationData = await Location().getLocation();
print(locationData.latitude);


}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 170,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: (_previewLocationUrl == null)
                ? const Center(
                    child: Text("no location yet"),
                  )
                : Image.network(
                    _previewLocationUrl!,
                    fit: BoxFit.cover,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("current Location"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("select map"),
            ),
          ],
        )
      ],
    );
  }
}
