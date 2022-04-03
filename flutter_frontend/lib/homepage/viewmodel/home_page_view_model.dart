import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view_model/base_view_model.dart';
import 'package:flutter_application_1/signup/view/signup_view.dart';

class HomePageViewModel extends BaseViewModel {
  late String _text;

  HomePageViewModel() : super();
  void initialize() {
  }

  String getText() {
    return _text;
  }

  void onTap() {
    _text = 'Pressed';
    notifyListeners();
  }

  void navigate(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignupView()));
  }
}
