import '../../../../../application/app/contact/contact_future_provider.dart';
import '../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../domain/contact/contact.dart';
import '../../../../constants/style_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../loader.dart';
import 'components/user_info_card.dart';
import '../../../../../domain/contact/contact_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserInfoCardList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authData = useProvider(authDataStateNotifierProvider).state;
    final contact = useProvider(contactFutureProvider(authData.data.token));

    return contact.when(
      data: (data) {
        if (data is Contact) {
          List<ContactData> contacts = data.data.reversed.toList();
          return Container(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                for (int i = 0; i < contacts.length; i++) ...[
                  i == contacts.length - 1
                      ? Positioned(
                          top: 10 + i * 32.0,
                          child: UserInfoCard(
                            userCode: contacts[i].userCode,
                            userName: contacts[i].fullName,
                            color: userCardBackground,
                          ),
                        )
                      : Positioned(
                          top: 10 + i * 32.0,
                          child: UserInfoCard(
                            userCode: contacts[i].userCode,
                            userName: contacts[i].fullName,
                            color: userCardBackgroundLight,
                          ),
                        )
                ]
              ],
            ),
          );
        } else {
          return Text('error');
        }
      },
      loading: () => Loader(),
      error: (object, stackTrace) {
        return Center(
          child: Text('$object'),
        );
      },
    );
  }
}
