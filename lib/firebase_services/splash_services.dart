
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_bzu/SplashScreen/authentication/login_screen.dart';

class SplashServices{

  void isLogin(BuildContext context){
    Timer( const Duration(seconds: 5), () =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())));

  }

}