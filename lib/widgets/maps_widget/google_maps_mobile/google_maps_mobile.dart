import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../values/images.dart';

class GoogleMapsWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double zoom;
  final String idName;

  const GoogleMapsWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.zoom,
    required this.idName,
  }) : super(key: key);

  @override
  State<GoogleMapsWidget> createState() => GoogleMapsWidgetState();
}

class GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: widget.zoom,
        ),
        scrollGesturesEnabled: true,
          zoomGesturesEnabled:true,
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
        markers: {
          Marker(
            markerId: MarkerId(widget.idName),
            position: LatLng(widget.latitude, widget.longitude),
            icon: markerIcon,
          )
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), AppImages.centeLocationMarker)
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }
}
