import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_states.dart';
import 'package:scoped_guide/scoped_model/success_model.dart';
import 'package:scoped_guide/ui/views/base_view.dart';
import 'package:scoped_guide/ui/widgets/busy_overlay.dart';

class SuccessView extends StatelessWidget {
  final String title;

  SuccessView({this.title});

  @override
  Widget build(BuildContext context) {
    return BaseView<SuccessModel>(
        onModelReady: (model) => model.fetchDuplicatedText(title),
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.Busy,
              child: Scaffold(
                body: Center(child: Text(model.title)),
              ),
            ));
  }
}
