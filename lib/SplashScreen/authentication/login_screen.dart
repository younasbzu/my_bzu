
import 'package:flutter/material.dart';
import 'package:my_bzu/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();

}

class _LoginState extends State<LoginScreen> {
  final _formKey= GlobalKey<FormState>();
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
    return Scaffold(
      body: Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller:emailController,
                      decoration:const InputDecoration(
                        hintText: 'Email',
                       // helperText: 'abc@gmail.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email';
                        }
                        return null;
                      } ,
                    ),
                   const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      decoration:const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.key),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter password';
                        }
                        return null;
                      } ,
                    ),
                  ],
                )
            ),
           const SizedBox(height: 50,),

            RoundButton(
              title: 'Login',
              onTap: (){
                if(_formKey.currentState!.validate()){

                }
              },
            )

          ],
        ),
      ),
    );
  }
}
