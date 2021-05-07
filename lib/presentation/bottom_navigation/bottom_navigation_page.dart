import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/communication/communication_page.dart';
import '../app/home/home_page.dart';
import '../app/settings/settings_page.dart';
import '../constants/style_constants.dart';
import 'bar.dart';

class NavigationPage extends StatefulWidget {
  static const routeName = '/navigation';
  final int index;

  const NavigationPage({
    this.index = 0,
  });

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
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
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(
            () => _currentIndex = index,
          );
          _pageController.jumpToPage(index);
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
