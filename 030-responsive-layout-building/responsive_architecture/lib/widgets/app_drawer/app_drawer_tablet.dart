import 'package:flutter/material.dart';

class AppDrawerTabletPortrait extends StatelessWidget {
  const AppDrawerTabletPortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: Colors.deepOrange,
          boxShadow: [BoxShadow(blurRadius: 16, color: Colors.purpleAccent)]),
    );
  }
}
