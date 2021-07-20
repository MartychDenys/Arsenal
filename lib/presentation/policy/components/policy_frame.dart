import 'package:flutter/material.dart';

import '../../app/components/app_bar_with_back_button.dart';

class PolicyFrame extends StatelessWidget {
  const PolicyFrame({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: title,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: child,
          ),
        ),
      ),
    );
  }
}
