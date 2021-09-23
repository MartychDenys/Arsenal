import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProvideConclusionImageService {
  Future<File> getImageGallery() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    return File(image.path);
  }

  Future<File> getImageCamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    return File(image.path);
  }
}