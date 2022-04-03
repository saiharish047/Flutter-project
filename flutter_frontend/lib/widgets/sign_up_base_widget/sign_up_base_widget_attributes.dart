class SignUpPageAttributes{
  bool showButton;
  Function(String) onUserNameChanged;
  Function(String) onEmailIDNameChanged;
  Function(String) onDobChanged;


  SignUpPageAttributes({
  required this.showButton,
  required this.onUserNameChanged,
  required this.onEmailIDNameChanged,
  required this.onDobChanged,  
  });
}