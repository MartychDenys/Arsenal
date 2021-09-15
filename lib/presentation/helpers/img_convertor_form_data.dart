import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

Future<FormData> convertFileToFormData(File file) async {
  final filename = file.path.split('/').last;
  final fileType = file.path.split('.').last;

  print('filename $filename');

  final formData = FormData.fromMap(
    {
      'file': await MultipartFile.fromFile(
        file.path,
        filename: filename,
      ),
      'type': 'image/$fileType'
    },
  );

  return formData;
}

Future<String> convertToBase64(File file) async {
  final bytes = file.readAsBytesSync();
  String _img64 = await base64Encode(bytes);
  final fileType = file.path.split('.').last;

  return 'data:image/$fileType;base64,$_img64';
}