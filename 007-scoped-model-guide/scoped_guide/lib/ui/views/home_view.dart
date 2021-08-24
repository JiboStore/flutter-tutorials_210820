import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_states.dart';
import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_model/home_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
        model: locator<HomeModel>(),
        child: ScopedModelDescendant<HomeModel>(
          builder: (context, child, model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.saveData();
                },
              ),
              body: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                _getBodyUi(model.state),
                Text(model.title),
              ]))),
        ));
  }

  Widget _getBodyUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();
      case ViewState.Retrieved:
      default:
        return Text('Done');
    }
  }
}
