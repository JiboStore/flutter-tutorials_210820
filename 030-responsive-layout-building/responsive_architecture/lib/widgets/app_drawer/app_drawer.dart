import 'package:flutter/material.dart';
import 'package:responsive_architecture/responsive/orientation_layout.dart';
import 'package:responsive_architecture/responsive/screen_type_layout.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer_tablet.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const AppDrawerMobileLayout(),
      tablet: const OrientationLayout(
        portrait: AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),
    );
    // var orientation = MediaQuery.of(context).orientation;
    // return Container(
    //   width: orientation == Orientation.portrait ? 250 : 100,
    //   decoration: BoxDecoration(color: Colors.blue, boxShadow: [
    //     BoxShadow(
    //       blurRadius: 16,
    //       color: Colors.black12,
    //     )
    //   ]),
    // );
  }
}
