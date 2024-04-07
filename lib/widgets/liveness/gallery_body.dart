import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';


///
///Liveness
///
///
 Widget galleryBody(File? _image, CustomPaint? customPaint,ImagePicker _imagePicker) {
    return ListView(shrinkWrap: true, children: [
      _image != null
          ? Container(
        height: 400,
        width: 400,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.file(_image!),
            if (customPaint != null) customPaint!,
          ],
        ),
      )
          : const Icon(
        Icons.image,
        size: 200,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: const Text('From Gallery'),
          onPressed: () => getImage(ImageSource.gallery, _imagePicker),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: const Text('Take a picture'),
          onPressed: () => getImage(ImageSource.camera,_imagePicker),
        ),
      ),
    ]);
  }

Future getImage(ImageSource source,ImagePicker _imagePicker) async {
  final pickedFile = await _imagePicker.pickImage(source: source);
  //setState(() {});

  return pickedFile;
}

