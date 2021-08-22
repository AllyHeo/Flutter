import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  BitmapDescriptor? mapMarker;
  AirResult? _result;

  Future<AirResult> fetchData() async {
    var response = await http.get(
      Uri.parse(
          'http://api.airvisual.com/v2/nearest_city?key=95056979-70f4-48e0-b41d-ff9af8613029'),
    );

    AirResult result = AirResult.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();

    fetchData().then((airResult) {
      setState(() {
        _result = airResult;
      });
    });
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/destination_map_marker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(_result!.data!.location!.coordinates![1],
                _result!.data!.location!.coordinates![0]),
            icon: mapMarker!,
            infoWindow: InfoWindow(
              title: '${_result!.data!.country}',
              snippet: '${_result!.data!.city}',
            )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
              target: LatLng(_result!.data!.location!.coordinates![1],
                  _result!.data!.location!.coordinates![0]),
              zoom: 15)),
    );
  }
}
