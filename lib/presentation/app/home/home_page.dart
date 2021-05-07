import '../../../application/app/contact/contact_future_provider.dart';
import '../../../application/auth/auth_data_state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'components/call_assistant_button.dart';
import 'components/user_insurances_card/icsurance_card.dart';
import 'components/user_info_card/user_info_card_list.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authData = useProvider(authDataStateNotifierProvider).state;
    final contact = useProvider(contactFutureProvider(authData.data.token));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: UserInfoCardList(),
                flex: 6,
              ),
              Expanded(
                child: CallAssistantButton(),
                flex: 2,
              ),
              Expanded(
                child: InsuranceCard(),
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
