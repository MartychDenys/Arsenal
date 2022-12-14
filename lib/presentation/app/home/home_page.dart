import '../components/popups/additional_popup.dart';
import '../components/popups/popup_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/call_assistant_button.dart';
import 'components/user_info_card/components/user_info_card.dart';
import 'components/user_insurances_card/icsurance_card.dart';

import '../../constants/spacers.dart';
import '../../constants/style_constants.dart';
import '../../loader.dart';
import '../../../application/app/insurances/insurances_future_provider.dart';
import '../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../application/app/contact/contact_list_state_notifier_provider.dart';
import '../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../domain/contact/contact_data.dart';
import '../../../domain/insurance/insurance.dart';
import '../../../domain/request_body.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userData = useProvider(currentContactStateNotifierProvider);
    final contactData = useProvider(contactListStateNotifierProvider.state);
    List<ContactData> contacts = contactData.data;
    final authData =
        useProvider(authDataStateNotifierProvider.state).data.token;
    final userId = useProvider(currentContactStateNotifierProvider.state);

    final insurance = useProvider(
        insurancesFutureProvider(RequestBody(token: authData, id: userId)));

    final prov = useState(0);
    contacts.sort((a, b) {
      if (b.mainContact) {
        return 1;
      }
      return -1;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              Container(
                height: 230 + contacts.length * 32.0,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    for (int i = contacts.length - 1; i >= 0; i--) ...[
                      Positioned(
                        top: contacts.length.toDouble() * 28 - i * 32.0,
                        child: UserInfoCard(
                          userCode: contacts[i].userCode != null ? contacts[i].userCode : '',
                          userName: contacts[i].fullName,
                          color: i == 0
                              ? userCardBackground
                              : userCardBackgroundLight,
                          onTap: () {
                            if (contacts[i].mainContact == false) {
                              contacts[0].mainContact = false;
                              contacts[i].mainContact = true;
                              userData.updateContactData(contacts[i].id);
                              print(contacts[i].id);
                              prov.value++;
                            }
                          },
                        ),
                      )
                    ]
                  ],
                ),
              ),
              SpaceH16(),
              CallAssistantButton(
                  showNumberNotFoundPopup: () {
                    showCustomDialog(
                      context: context,
                      child: NumberNotFoundPoppup(),
                    );
                  },
              ),
              SpaceH16(),
              insurance.when(
                data: (data) {
                  if (data is Insurance) {
                    return InsuranceCard(
                      insuranceList: data.data,
                    );
                  } else {
                    return Text('Error');
                  }
                },
                loading: () => Loader(),
                error: (object, stackTrace) {
                  return Center(
                    child: Text('contract_not_found'.tr()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
