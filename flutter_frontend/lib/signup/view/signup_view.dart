import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view/base_view.dart';
import 'package:flutter_application_1/signup/viewmodel/signup_view_model.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = SignupViewModel();
    return BaseView<SignupViewModel>(
      setupViewModel: (viewModel) => viewModel.initialize(),
      viewModel: _viewModel,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(children: [
            Text(viewModel.getText()),
            ElevatedButton(onPressed: viewModel.onPressed, child: Text('Hello there'))
          ]),
        );
      },
    );
  }
}
