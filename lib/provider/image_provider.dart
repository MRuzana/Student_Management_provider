import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project3/widgets/pick_image.dart';

class PickImageProvider extends ChangeNotifier{

 Future< Uint8List?> addImage()async{
  
     Uint8List? imageBytes = await pickImage(ImageSource.gallery);
     notifyListeners();
    return imageBytes;
  }
}