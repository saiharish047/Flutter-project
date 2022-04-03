import 'package:flutter_application_1/base_classes/view_model/base_view_model.dart';

class SignupViewModel extends BaseViewModel {
  String? _userName;
  String? _emailId;
  String? _dateOfBirth;
  String? _password;
  String? _confirmPassword;
  SignupViewModel() : super();

  void initialize() {

  }

  bool hasEnteredAllData() {
    if (_userName != null && _emailId != null && _dateOfBirth != null && checkPasswords()) {
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

  void onPasswordEntered(String password){
    _password = password;
    notifyListeners();
  }

  void onConfirmPassword(String confirmPassword){
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  bool checkAllConditionsForPassword(){
    if(_password!=null){
      if( _password!.length > 5){
        return true;
      }
    }
    return false;
  }

  bool checkPasswords(){
    if(_password!=null && _confirmPassword!=null){
      if(_password == _confirmPassword){
        return true;
      }
    }
    return false;
  }
}
