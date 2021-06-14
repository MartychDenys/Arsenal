import '../../../../constants/style_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/user_info_card.dart';
import '../../../../../domain/contact/contact_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../../application/app/contact/contact_list_state_notifier_provider.dart';

class UserInfoCardList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userData = useProvider(currentContactStateNotifierProvider);
    final contactData = useProvider(contactListStateNotifierProvider.state);

    List<ContactData> contacts = contactData.data;

    final prov = useState(0);
    contacts.sort((a, b) {
      if (b.mainContact) {
        return 1;
      }
      return -1;
    });

    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          for (int i = contacts.length - 1; i >= 0; i--) ...[
            Positioned(
              top: 100 - i * 32.0,
              child: UserInfoCard(
                userCode: contacts[i].userCode,
                userName: contacts[i].fullName,
                color: i == 0 ? userCardBackground : userCardBackgroundLight,
                onTap: () {
                  if (contacts[i].mainContact == false) {
                    contacts[0].mainContact = false;
                    contacts[i].mainContact = true;
                    userData.updateContactData(contacts[i].userCode);
                    prov.value++;
                  }
                },
              ),
            )
          ]
        ],
      ),
    );
  }
}
