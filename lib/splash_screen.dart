import 'package:flutter/material.dart';
import 'package:quad/bottom_navigation_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

   

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
    const Duration( seconds:3),(){
     Navigator.pushReplacement(context, 
     MaterialPageRoute(builder: (context)=> const BottomNavigation()));
    }                
    );
    return Scaffold(
      body: Center(
      child: Image.asset('assets/images/splash_pic.jpg')
      ),
    );
  }
}