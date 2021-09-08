import 'package:flutter/material.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer.dart';

class AppDrawerMobileLayout extends StatelessWidget {
  const AppDrawerMobileLayout({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Container(
        width: orientation == Orientation.portrait ? 250 : 100,
        decoration: BoxDecoration(
            color: Colors.amber,
            boxShadow: [BoxShadow(blurRadius: 16, color: Colors.blueAccent)]),
        child: Column(
          children: AppDrawer.getDrawerOptions(),
        ),
      );
    });
  }
}
