

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bzu/Dashboard/dashboard_screen.dart';
import 'package:my_bzu/SplashScreen/authentication/signup_screen.dart';
import 'package:my_bzu/Utils/utils.dart';
import 'package:my_bzu/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

 class _LoginScreenState extends State<LoginScreen> {
  bool loading=false;
  final _formKey=GlobalKey<FormState>();
   final emailController=TextEditingController();
   final passwordController= TextEditingController();

   final _auth= FirebaseAuth.instance;

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login (){
     setState(() {
       loading=true;
     });

     _auth.signInWithEmailAndPassword(
         email:emailController.text.toString(),
          password: passwordController.text.toString()).then((value){

            Utils().toastMessage(value.user!.email.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const DashboardScreen())
            );
            setState(() {
              loading=false;
            });

     }).onError((error, stackTrace){

       debugPrint(error.toString());
       Utils().toastMessage(error.toString());
       setState(() {
         loading=false;
       });

     });
  }

   @override
   Widget build(BuildContext context) {
     return WillPopScope(
       onWillPop: ()async{
         SystemNavigator.pop();
         return true;
       },
       child: Scaffold(
         appBar: AppBar(
           automaticallyImplyLeading: false,
           title:const Text('Login'),
         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Form(
               key: _formKey,
                 child: Column(
                   children: [
                     TextFormField(
                       keyboardType: TextInputType.emailAddress,
                       controller: emailController,
                       decoration:const InputDecoration(
                         hintText: 'Email',
                         prefixIcon: Icon(Icons.email_outlined),
                       ),
                       validator: (value){
                         if(value!.isEmpty){
                           return 'Enter email';
                         }
                         return null;
                       },
                     ),
                    const SizedBox(height: 10,),
                     TextFormField(
                       keyboardType: TextInputType.text,
                       obscureText: true,
                       controller: passwordController,
                       decoration:const InputDecoration(
                         hintText: 'Password',
                         prefixIcon: Icon(Icons.key),

                       ),
                       validator: (value){
                         if(value!.isEmpty){
                           return 'Enter password';
                         }
                         return null;
                       },
                     ),

                   ],
                 )
             ),
             const SizedBox(height: 50,),
             RoundButton(
                 title: 'Login',
                 loading: loading,
                 onTap: (){
             if(_formKey.currentState!. validate()){
               login();

             }
             }),
             const SizedBox(height: 30,),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 const Text("Don't have an account?"),
                 TextButton(onPressed: (){
                   Navigator.push(context,
                     MaterialPageRoute(
                         builder: (context)=> const SignupScreen())
                   );
                 },
                     child: const Text('Sign p'))

               ],
             )
           ],
         ),
       ),
     );
   }
 }
