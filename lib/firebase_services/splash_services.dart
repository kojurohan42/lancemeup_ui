import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lanceme_up/ui/auth/login_screen.dart';
import 'package:lanceme_up/ui/home_page.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
