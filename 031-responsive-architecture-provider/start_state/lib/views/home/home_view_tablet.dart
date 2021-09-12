import 'package:flutter/material.dart';
import 'package:responsive_architecture/viewmodels/home_view_model.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer.dart';
import 'package:responsive_architecture/widgets/base_model_widget.dart';

// class HomeViewTablet extends StatelessWidget {
class HomeViewTablet extends BaseModelWidget<HomeViewModel> {
  // const HomeViewTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    var children = [
      Expanded(
        child: Center(
          child: Text(model.title),
        ),
      ),
      AppDrawer()
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.updateTitle();
        },
      ),
      body: orientation == Orientation.portrait
          ? Column(children: children)
          : Row(children: children.reversed.toList()),
    );
  }
}
