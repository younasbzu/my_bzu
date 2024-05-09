
import 'package:flutter/material.dart';
import 'package:my_bzu/SplashScreen/authentication/login_screen.dart';
import 'package:my_bzu/widgets/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController= TextEditingController();
  final nameController= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Sign up'),
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
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration:const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter First name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration:const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
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
          const  SizedBox(height: 50,),
          RoundButton(
              title: 'Sign up',
              onTap: (){
                if(_formKey.currentState!. validate()){

                }
              }),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Already have an account?"),
              TextButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> LoginScreen())
                );

              },
                  child: const Text('Login'))

            ],
          )
        ],
      ),
    );
  }
}
