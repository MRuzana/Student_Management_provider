import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImage(ImageSource source) async {
  try {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: source);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      return bytes;
    } else {
      print('No image selected');
      return null;
    }
  } catch (e) {
    print('Error picking image: $e');
    return null;
  }
}