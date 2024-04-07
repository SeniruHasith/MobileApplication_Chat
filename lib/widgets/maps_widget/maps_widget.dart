import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'google_maps_mobile/google_maps_mobile.dart'
    if (dart.library.html) './google_maps_web/google_maps_web.dart';
import 'huawei_maps/huawei_maps.dart';

class MapsWidget extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double zoom;
  final String idName;

  const MapsWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.zoom,
    required this.idName,
  }) : super(key: key);

  @override
  State<MapsWidget> createState() => MapsWidgetState();
}

class MapsWidgetState extends State<MapsWidget> {
  bool isDeviceHuawei = false;
  bool deviceDataLoaded = false;

  @override
  void initState() {
    super.initState();
    checkDevice();
  }

  @override
  Widget build(BuildContext context) {
    return deviceDataLoaded
        ? isDeviceHuawei
            ? HuaweiMapsWidget(
                latitude: widget.latitude,
                longitude: widget.longitude,
                zoom: widget.zoom,
                idName: widget.idName,
              )
            : GoogleMapsWidget(
                latitude: widget.latitude,
                longitude: widget.longitude,
                zoom: widget.zoom,
                idName: widget.idName,
              )
        : Container();
  }

  checkDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.manufacturer}');
      if (androidInfo.manufacturer.toLowerCase().contains('huawei')) {
        setState(() {
          isDeviceHuawei = true;
          deviceDataLoaded = true;
        });
      } else {
        setState(() {
          isDeviceHuawei = false;
          deviceDataLoaded = true;
        });
      }
    } on Exception catch (_) {
      setState(() {
        isDeviceHuawei = false;
        deviceDataLoaded = true;
      });
    }
  }
}
