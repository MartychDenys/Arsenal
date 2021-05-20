import 'package:dio/dio.dart';
import '../../domain/contact/contact.dart';
import '../constants.dart';

class ContactProvider {
  Future<Contact> getUserContact(String token) async {
    Contact contact;

    const url = '${apiUrl}/dms/personal/getContactData/';
    final _dio = Dio();

    try {
      final response = await _dio.get(
        '${url}?_token=${token}',
      );
      final responseData = response.data as Map<String, dynamic>;
      print(responseData);
      contact = Contact.fromJson(responseData);
    } catch (error) {
      print(error.toString());
    }

    return contact;
  }
}
