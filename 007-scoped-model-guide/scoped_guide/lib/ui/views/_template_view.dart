import 'package:flutter/material.dart';
import 'package:scoped_guide/scoped_model/home_model.dart';
import 'package:scoped_guide/ui/views/base_view.dart';

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) => Scaffold(
        body: Center(child: Text(this.runtimeType.toString())),
      ),
    );
  }
}
