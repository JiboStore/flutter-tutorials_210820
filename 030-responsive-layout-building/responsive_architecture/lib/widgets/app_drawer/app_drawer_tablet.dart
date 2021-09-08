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

class AppDrawerTabletLandscape extends StatelessWidget {
  const AppDrawerTabletLandscape({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: Colors.indigo,
          boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black12)]),
    );
  }
}
