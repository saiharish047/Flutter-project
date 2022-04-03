import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view/base_view.dart';
import 'package:flutter_application_1/signup/viewmodel/signup_view_model.dart';
import 'package:flutter_application_1/widgets/sign_up_base_widget/sign_up_base_widget.dart';
import 'package:flutter_application_1/widgets/sign_up_base_widget/sign_up_base_widget_attributes.dart';

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
          appBar: AppBar(),
          body: SignUpPage(
            attributes: SignUpPageAttributes(
              showButton: _viewModel.hasEnteredAllData(),
              onEmailIDNameChanged: viewModel.onEmailId, 
              onUserNameChanged: viewModel.onUserNameChanged,
              onDobChanged: viewModel.enteredDob, 
              showErrorForPassword: viewModel.checkAllConditionsForPassword(), 
              showErrorConfirmPassword: viewModel.checkPasswords(),
            ),
          ),
        );
      },
    );
  }
}
