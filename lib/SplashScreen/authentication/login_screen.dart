import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bzu/SplashScreen/authentication/signup_screen.dart';
import 'package:my_bzu/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

 class _LoginScreenState extends State<LoginScreen> {

  final _formKey=GlobalKey<FormState>();
   final emailController=TextEditingController();
   final passwordController= TextEditingController();

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                 onTap: (){
             if(_formKey.currentState!. validate()){

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
                         builder: (context)=> const SignUpScreen())
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
