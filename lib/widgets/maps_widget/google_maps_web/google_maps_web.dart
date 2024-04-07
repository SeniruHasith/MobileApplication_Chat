
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';
import 'package:google_maps/google_maps.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMapsWebWidget(widget.latitude,widget.longitude,widget.zoom,widget.idName)
    );
  }

  Widget GoogleMapsWebWidget(latitude,longitude,zoom,idName) {
    String htmlId = "google-maps-html-element"+latitude.toString()+longitude.toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(latitude, longitude);

      final mapOptions = MapOptions()
        ..zoom = zoom
        ..center = LatLng(latitude, longitude);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = idName
          ..icon=AppImages.centeLocationMarker
      );

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}













