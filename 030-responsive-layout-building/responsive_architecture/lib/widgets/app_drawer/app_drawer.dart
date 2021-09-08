import 'package:flutter/material.dart';
import 'package:responsive_architecture/responsive/orientation_layout.dart';
import 'package:responsive_architecture/responsive/screen_type_layout.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer_tablet.dart';
import 'package:responsive_architecture/widgets/drawer_option/drawer_option.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(title: 'Images', iconData: Icons.image),
      DrawerOption(title: 'Reports', iconData: Icons.photo_filter),
      DrawerOption(title: 'Incidents', iconData: Icons.message),
      DrawerOption(title: 'Settings', iconData: Icons.settings),
    ];
  }

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
