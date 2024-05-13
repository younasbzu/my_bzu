import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_bzu/SplashScreen/authentication/verify_code.dart';
import 'package:my_bzu/Utils/utils.dart';
import 'package:my_bzu/widgets/round_button.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  bool loading=false;
  final phoneNumberController=TextEditingController();
  final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
           const SizedBox(height: 80,),

            TextFormField(
              controller: phoneNumberController,
              decoration:const InputDecoration(
                hintText: '03000000000'
              ),
            ),
            const SizedBox(height: 80,),
            RoundButton(title: 'Login', onTap: (){
              auth.verifyPhoneNumber(
                phoneNumber:phoneNumberController.text ,
                  verificationCompleted: (_){

                  },
                  verificationFailed: (e){
                  Utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationId, int? token){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => VerifyCodeScreen(verificationId: verificationId,)));

                  },
                  codeAutoRetrievalTimeout: (e){
                  Utils().toastMessage(e.toString());
                  });

            })

          ],
        ),
      ),
    );
  }
}
