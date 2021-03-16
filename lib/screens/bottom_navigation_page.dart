import 'package:arsenal_app/bottom_navigation/bar.dart';
import 'package:arsenal_app/locale/app_localizations.dart';
import 'file:///C:/Users/Eugene/arsenal_app/lib/screens/communication_page/communication_page.dart';
import 'file:///C:/Users/Eugene/arsenal_app/lib/screens/home_page/home_page.dart';
import 'file:///C:/Users/Eugene/arsenal_app/lib/screens/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPage extends StatefulWidget {
  static const routeName = '/navigation';
  final index;

  NavigationPage({this.index = 0});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  //int _currentIndex = 0;
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
            MainPage(),
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
              AppLocalizations.of(context).translate('main'),
            ),
            icon: Icon(
              Icons.home,
            ),
            activeColor: Colors.white,
            inactiveColor: Color.fromRGBO(96, 110, 117, 1),
            textAlign: TextAlign.center,
          ),
          BottomNavigBarItem(
            title: Text(
              AppLocalizations.of(context).translate('settings'),
            ),
            icon: Icon(
              Icons.settings,
            ),
            activeColor: Colors.white,
            inactiveColor: Color.fromRGBO(96, 110, 117, 1),
            textAlign: TextAlign.center,
          ),
          BottomNavigBarItem(
            title: Text(
              AppLocalizations.of(context).translate('communication'),
            ),
            icon: Icon(
              Icons.phone,
            ),
            activeColor: Colors.white,
            inactiveColor: Color.fromRGBO(96, 110, 117, 1),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
