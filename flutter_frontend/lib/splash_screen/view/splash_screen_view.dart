import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_classes/view/base_view.dart';
import 'package:flutter_application_1/signup/view/signup_view.dart';
import 'package:flutter_application_1/splash_screen/viewModel/splash_screen_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    navigateToHomeScreen();
  }

  Future navigateToHomeScreen()async{
    return Future.delayed(const Duration(milliseconds: 3000),(){
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder:(context)=>const SignupView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = SplashScreenViewModel();
    return BaseView<SplashScreenViewModel>(
      viewModel: _viewModel,
      setupViewModel: (viewModel) => viewModel.initialize(),
      builder: (context,viewModel,child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(0x13, 0x29, 0x4B, 1),
          body: Center(
            child: Image.asset('assets/images/splash_screen_loader.gif',height: 400,width: 400,colorBlendMode: BlendMode.clear,),
          ),
        );
      },

    );
  }
}
