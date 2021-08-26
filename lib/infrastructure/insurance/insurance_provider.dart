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


  Future<bool> getUserInsuranceExpired(String token, String id) async {
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

    final expiredInsurance = checkExpiredInsurance(insurance);
    return expiredInsurance;
  }


  bool checkExpiredInsurance(Insurance insurance) {
    bool answer = false;
    var currentDay = DateTime
        .now()
        .day;
    var currentYear = DateTime
        .now()
        .year;
    var currentMonth = DateTime
        .now()
        .month;

    final insuranceDate = insurance.data[0].dealInfo.closeDate.split('.');
    final insuranceDay = insuranceDate[0];
    final insuranceMonth = insuranceDate[1];
    final insuranceYear = insuranceDate[2].split(' ')[0];

    try {
      final insurenceSumm = int.parse(insuranceYear) +
          int.parse(insuranceMonth) + int.parse(insuranceDay);
      final currentSumm = currentYear + currentMonth + currentDay;

      if (insurenceSumm <= currentSumm) {
        answer = true;
      } else {
        answer = false;
      }
    } catch (error) {
      print('ERROR -> $error');
    }
    return answer;
  }
}
