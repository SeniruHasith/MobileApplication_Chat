import 'package:flutter/material.dart';
import 'package:huawei_map/huawei_map.dart';
import 'dart:developer';

class HuaweiMapsWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double zoom;
  final String idName;

  const HuaweiMapsWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.zoom,
    required this.idName,
  }) : super(key: key);

  @override
  State<HuaweiMapsWidget> createState() => HuaweiMapsWidgetState();
}

class HuaweiMapsWidgetState extends State<HuaweiMapsWidget> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    super.initState();
  }

  double top = 0.0;
  double distance = 0.0;
  LatLng? convertedLatLng;
  bool hmsLoggerStatus = true;

  static const LatLng _center = LatLng(41.012959, 28.997438);
  static const double _zoom = 12;

  late HuaweiMapController mapController;

  MapType _currentMapType = MapType.normal;
  bool _trafficEnabled = false;
  bool _isLocSourceActive = false;

  void _onMapCreated(HuaweiMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:           HuaweiMap(
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: _zoom,
        ),
        onMapCreated: _onMapCreated,
        mapType: _currentMapType,
        tiltGesturesEnabled: true,
        buildingsEnabled: true,
        compassEnabled: true,
        zoomControlsEnabled: true,
        rotateGesturesEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        padding: const EdgeInsets.only(bottom: 30.0),
        trafficEnabled: _trafficEnabled,
        logoPosition: HuaweiMap.LOWER_LEFT,
        logoPadding: const EdgeInsets.only(
          left: 15,
          bottom: 75,
        ),
        myLocationStyle: const MyLocationStyle(
            anchor: Offset(0.5, 0.5), radiusFillColor: Colors.red),
        onClick: (LatLng latLng) async {
          log('Map Clicked at ${latLng.lat} : ${latLng.lng}');
          if (_isLocSourceActive) mapController.setLocation(latLng);
          double? res = await mapController.getScalePerPixel();
          log(res.toString(), name: "getScalePerPixel");
        },
      ),
    );
  }
}