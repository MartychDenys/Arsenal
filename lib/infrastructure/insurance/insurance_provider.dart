import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/insurance/insurance.dart';
import '../constants.dart';

class InsuranceProvider {
  Future<Insurance> getUserInsurance(String token, String id) async {
    final _dio = Dio();
    Insurance insurance;

    final url =
        '${apiUrl}/dms/personal/getDeals/?_token=$token&contactId=$id&filter[CATEGORY_ID]=2';

    try {
      final response = await _dio.get(url);
      final responseData = response.data as Map<String, dynamic>;
      insurance = Insurance.fromJson(responseData);
    } catch (error) {
      print(error.toString());
    }

    return insurance;
  }


  Future<bool> getUserInsuranceExpired(String token, String userId) async {
    final _dio = Dio();
    Insurance insurance;

    final url =
        '${apiUrl}/dms/personal/getDeals/?_token=$token&contactId=$userId&filter[CATEGORY_ID]=2';

    try {
      final response = await _dio.get(url);
      final responseData = response.data as Map<String, dynamic>;

      if(responseData['data'].isEmpty) {
        return false;
      }

      insurance = Insurance.fromJson(responseData);
    } catch (error) {
      print(error.toString());
    }

    final expiredInsurance = checkExpiredInsurance(insurance);
    return expiredInsurance;
  }


  bool checkExpiredInsurance(Insurance insurance) {
    print('insurance.data ${insurance.data}');
    final insuranceDate = insurance.data[0].dealInfo.closeDate.split('.');
    final insuranceDay = insuranceDate[0];
    final insuranceMonth = insuranceDate[1];
    final insuranceYear = insuranceDate[2].split(' ')[0];

    final dataUtc = DateTime.utc(int.parse(insuranceYear), int.parse(insuranceMonth), int.parse(insuranceDay));
    final insuranceTimestamp = dataUtc.microsecondsSinceEpoch;
    final currentTimestamp = DateTime.now().microsecondsSinceEpoch;

    if (insuranceTimestamp > currentTimestamp) {
      return true;
    } else {
      return false;
    }
  }
}
