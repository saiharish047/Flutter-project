import 'package:flutter_application_1/base_classes/view_model/base_view_model.dart';

class SignupViewModel extends BaseViewModel {
  String? _userName;
  String? _emailId;
  String? _dateOfBirth;

  SignupViewModel() : super();

  void initialize() {}

  bool hasEnteredAllData() {
    if (_userName != null && _emailId != null && _dateOfBirth != null) {
      return true;
    }
    return false;
  }

  void onUserNameChanged(String userName) {
    _userName = userName;
    notifyListeners();

  }

  void onEmailId(String emailID) {
    _emailId = emailID;
    notifyListeners();

  }

  void enteredDob(String dateOfBirth) {
    _dateOfBirth = dateOfBirth;
    notifyListeners();
  }
}
