import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationWidget extends StatefulWidget {
  final Color iconColor;
  final String locationText;
  final String statusText;

  LocationWidget({
    Key? key,
    required this.iconColor,
    required this.locationText,
    required this.statusText,
  }) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String _locationMessage = "Getting location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        setState(() {
          _locationMessage = "Location services are disabled.";
        });
      }
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          setState(() {
            _locationMessage = "Location permission denied.";
          });
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        setState(() {
          _locationMessage = "Location permission denied forever.";
        });
      }
      return;
    }

    // Get the current position (latitude and longitude)
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get the address (location name) using reverse geocoding
    _getAddressFromLatLng(position.latitude, position.longitude);
  }

  Future<void> _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      // Get the list of placemarks (addresses) from the latitude and longitude
      List<Placemark> placemarks = await GeocodingPlatform.instance!.placemarkFromCoordinates(latitude, longitude);

      // Get the first placemark (address)
      Placemark place = placemarks[0];

      // Update the UI with the address
      if (mounted) {
        setState(() {
          _locationMessage = "${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _locationMessage = "Could not get location name: $e";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.location_on,
            color: widget.iconColor,
            size: 20,
          ),
        ),
        Spacer(),

        // Column with location name and status
        Column(
          children: [
            Text(
              widget.locationText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              _locationMessage,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Spacer(),

        // Search icon on the right
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search,
            color: widget.iconColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
