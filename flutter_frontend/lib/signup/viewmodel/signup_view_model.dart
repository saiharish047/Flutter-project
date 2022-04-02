import 'package:flutter_application_1/base_classes/view_model/base_view_model.dart';

class SignupViewModel extends BaseViewModel {
  late String _text;
  SignupViewModel() : super();

  void initialize() {
    _text = 'Page2';
  }

  void onPressed() {
    _text = 'Page2Pressed';
    notifyListeners();
  }

  String getText() {
    return _text;
  }
}
