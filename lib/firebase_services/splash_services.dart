
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_bzu/Dashboard/dashboard_screen.dart';
import 'package:my_bzu/SplashScreen/authentication/login_screen.dart';

class SplashServices{


  void isLogin(BuildContext context){
    final auth= FirebaseAuth.instance;
    final user= auth.currentUser;

    if(user!=null){
      Timer( const Duration(seconds: 5), () =>  Navigator.push(context,
          MaterialPageRoute(builder: (context)=>const DashboardScreen())));

    }else{
      Timer( const Duration(seconds: 5), () =>  Navigator.push(context,
          MaterialPageRoute(builder: (context)=>const LoginScreen())));
    }



  }

}