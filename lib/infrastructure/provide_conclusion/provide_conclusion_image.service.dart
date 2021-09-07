import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProvideConclusionImageService {
  Future<File> getImageGallery() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<File> getImageCamera() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    return image;
  }
}