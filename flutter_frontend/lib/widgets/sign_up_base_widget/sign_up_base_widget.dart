import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/sign_up_base_widget/sign_up_base_widget_attributes.dart';

class SignUpPage extends StatefulWidget {
  final SignUpPageAttributes attributes;
  const SignUpPage({ Key? key,required this.attributes}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _userName = '';
  String _userEmail = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

      ],
    );
  }

  Widget _textFields(){
    return Column(
      children: const [

      ],
    );
  }

}