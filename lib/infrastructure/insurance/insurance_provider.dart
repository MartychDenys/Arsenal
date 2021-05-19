import 'package:dio/dio.dart';
import '../../domain/insurance/insurance.dart';

class InsuranceProvider {
  Future<Insurance> getUserInsurance(String token, String id) async {
    final _dio = Dio();
    Insurance insurance;

    final url =
        'https://b24arsenal-strahovanie.s11.itua.in.ua/local/api/dms/personal/getDeals/?_token=$token&contactId=$id&filter[CATEGORY_ID]=2';

    try {
      final response = await _dio.get(url);
      final responseData = response.data as Map<String, dynamic>;
      insurance = Insurance.fromJson(responseData);
    } catch (error) {
      print(error.toString());
    }

    return insurance;
  }
}
