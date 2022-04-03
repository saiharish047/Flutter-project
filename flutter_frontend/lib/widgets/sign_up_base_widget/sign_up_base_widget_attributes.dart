class SignUpPageAttributes{
  bool showButton;
  bool showErrorForPassword;
  bool showErrorConfirmPassword;
  Function(String) onUserNameChanged;
  Function(String) onEmailIDNameChanged;
  Function(String) onDobChanged;



  SignUpPageAttributes({
  required this.showButton,
  required this.showErrorForPassword,
  required this.showErrorConfirmPassword,
  required this.onUserNameChanged,
  required this.onEmailIDNameChanged,
  required this.onDobChanged,  
  });
}