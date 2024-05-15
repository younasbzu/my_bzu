import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_bzu/Dashboard/courses_screen.dart';
import 'package:my_bzu/SplashScreen/authentication/login_screen.dart';
import 'package:my_bzu/Utils/utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const LoginScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon:const Icon(Icons.logout)),
          const SizedBox(width: 10,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(crossAxisCount: 3,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const CourseScreen()));
            },
             child: Container(
                height: 50,
                width: 50,
                child:const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.book, color: Colors.blueAccent,),
                    Text('Courses'),
                  ],
                ),
              )
          )

          ],
        ),
      ),

    );
  }
}
