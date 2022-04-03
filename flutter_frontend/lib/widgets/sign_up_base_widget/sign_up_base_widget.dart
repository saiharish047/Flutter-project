import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/animated_button/animated_button.dart';
import 'package:flutter_application_1/widgets/date_with_textfield/date_with_textfield.dart';
import 'package:flutter_application_1/widgets/date_with_textfield/date_with_textfield_attributes.dart';
import 'package:flutter_application_1/widgets/sign_up_base_widget/sign_up_base_widget_attributes.dart';

class SignUpPage extends StatefulWidget {
  final SignUpPageAttributes attributes;
  const SignUpPage({ Key? key,required this.attributes}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _password = '';
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(height: 10,),
          _userEmailIdTextField(),
          SizedBox(height: 10,), 
          _userNameTextField(),
          SizedBox(height: 10,),
          DateOfBirthTextField(attributes: DateWithTextFieldAttributes(onDobChanged:widget.attributes.onDobChanged)),
          SizedBox(height: 10,),
          _enterPassword(),
          SizedBox(height: 10,),
          _confirmPassword(),
          SizedBox(height: 10,),      
          widget.attributes.showButton == true ? _bottomButton() : Container(),
        ],
      ),
    );
  }
  

  Widget _userEmailIdTextField(){
    return TextField(
      decoration: const InputDecoration(
        label: Text('Email ID'),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: widget.attributes.onEmailIDNameChanged,
    );
  }

  Widget _userNameTextField(){
    return TextField(
      decoration: const InputDecoration(
        label: Text('User Name'),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.name,
      onChanged: widget.attributes.onUserNameChanged,
    );
  }

  Widget _enterPassword(){
    TextEditingController _controller = TextEditingController();
    return TextField(
      controller: _controller,
      obscureText: true,
      obscuringCharacter: '*',
      decoration:InputDecoration(
        label: const Text('Enter Password'),
        border: const OutlineInputBorder(),
        
        errorBorder: const OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white, width: 0.0),
        ),
      ),
      keyboardType: TextInputType.name,
      onChanged:(password) {
        widget.attributes.onUserNameChanged(password);
        setState(() {
          _password = password;
        });
      }
      ,
    );
  }


  Widget _confirmPassword(){
    return TextField(
      obscuringCharacter: '*',
      obscureText: true,
      decoration: InputDecoration(
        label: const Text('Confirm Password'),
        border: const OutlineInputBorder(),
        errorBorder:  const OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white, width: 0.0),
        ),
      ),
      keyboardType: TextInputType.name,
      onChanged: widget.attributes.onUserNameChanged,
    );
  }




  Widget _bottomButton(){
    return const AnimatedButton();
  }

}