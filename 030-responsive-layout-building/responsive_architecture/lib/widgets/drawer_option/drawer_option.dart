import 'package:flutter/material.dart';
import 'package:responsive_architecture/responsive/orientation_layout.dart';
import 'package:responsive_architecture/responsive/screen_type_layout.dart';
import 'package:responsive_architecture/widgets/drawer_option/drawer_option_mobile.dart';
import 'package:responsive_architecture/widgets/drawer_option/drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;

  const DrawerOption({Key key, this.title, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
            portrait:
                DrawerOptionMobilePortrait(title: title, iconData: iconData),
            landscape: DrawerOptionMobileLandscape(iconData: iconData)),
        tablet: OrientationLayout(
            portrait:
                DrawerOptionTabletPortrait(title: title, iconData: iconData),
            landscape:
                DrawerOptionMobilePortrait(title: title, iconData: iconData)));
  }
}
