import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginHeader(
                      validationMessage: model.errorMessage,
                      controller: _controller),
                  model.state == ViewState.Busy
                      ? CircularProgressIndicator()
                      : TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            var loginSuccess =
                                await model.login(_controller.text);
                            if (loginSuccess) {
                              // Navigate to the home view
                              Navigator.pushNamed(context, '/');
                            }
                          },
                        )
                ])));
  }
}
