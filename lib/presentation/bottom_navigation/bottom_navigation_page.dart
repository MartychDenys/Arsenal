import '../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../application/auth/auth_data_state_notifier_provider.dart';
import '../../application/controller/controller_state_provider.dart';
import '../../application/controller/index_page_state_provider.dart';
import '../../infrastructure/insurance/insurance_service.dart';
import '../app/components/popups/additional_popup.dart';
import '../app/components/popups/popup_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/communication/communication_page.dart';
import '../app/home/home_page.dart';
import '../app/settings/settings_page.dart';
import '../constants/style_constants.dart';
import 'bar.dart';

class NavigationPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = useProvider(pageControllerStateProvider);
    final indexPageProvider = useProvider(indexPageStateProvider);

    final userId = useProvider(currentContactStateNotifierProvider);
    final authData = useProvider(authDataStateNotifierProvider);

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController.state,
          onPageChanged: (index) async {
            if (index == 2) {
              final insuranceExpired =
              await InsuranceService().insuranceExpired(
                authData.state.data.token,
                userId.state,
              );

              if (!insuranceExpired) {
                showCustomDialog(
                  context: context,
                  child: NumberNotFoundPoppup(),
                );
                return;
              }
            }


            indexPageProvider.state = index;
          },
          children: [
            HomePage(),
            SettingsPage(),
            CommunicationPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigBar(
        //containerHeight: 100,
        backgroundColor: Colors.white,
        itemCornerRadius: 5,
        selectedIndex: indexPageProvider.state,
        onItemSelected: (index) async {
          if (index == 2) {
            final insuranceExpired = await InsuranceService().insuranceExpired(
              authData.state.data.token,
              userId.state,
            );

            if (!insuranceExpired) {
              showCustomDialog(
                context: context,
                child: NumberNotFoundPoppup(),
              );
              return;
            }
          }

          indexPageProvider.state = index;
          _pageController.state.jumpToPage(indexPageProvider.state);
        },
        items: [
          BottomNavigBarItem(
            title: Text(
              'main'.tr(),
            ),
            icon: const Icon(
              Icons.home,
            ),
            activeColor: Colors.white,
            inactiveColor: subtitleColor,
            textAlign: TextAlign.center,
          ),
          BottomNavigBarItem(
            title: Text(
              'settings'.tr(),
            ),
            icon: const Icon(
              Icons.settings,
            ),
            activeColor: Colors.white,
            inactiveColor: subtitleColor,
            textAlign: TextAlign.center,
          ),
          BottomNavigBarItem(
            title: Text(
              'communication'.tr(),
            ),
            icon: const Icon(
              Icons.phone,
            ),
            activeColor: Colors.white,
            inactiveColor: subtitleColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
