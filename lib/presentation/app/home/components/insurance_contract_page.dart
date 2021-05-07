import '../../components/app_bar_with_back_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../communication/components/function_menu/components/paid_yourself/components/questions_widget.dart';
import 'insurance_details.dart';

class InsuranceContractPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'policies'.tr(),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InsuranceDetails(),
            QuestionsWidget(),
          ],
        ),
      ),
    );
  }
}
