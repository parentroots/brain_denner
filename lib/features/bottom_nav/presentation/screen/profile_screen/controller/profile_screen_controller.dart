
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? file;

  void pickImage() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      file = File(photo.path);
      update();
    }
  }
}
