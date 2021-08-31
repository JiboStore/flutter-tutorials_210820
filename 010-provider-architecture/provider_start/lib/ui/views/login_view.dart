import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => locator<LoginModel>(),
      child: Consumer<LoginModel>(
          builder: (context, model, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginHeader(controller: _controller),
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
                  ]))),
    );
  }
}
