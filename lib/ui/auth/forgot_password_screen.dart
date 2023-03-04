import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lanceme_up/utils/utils.dart';
import 'package:lanceme_up/widgets/round_button.dart';

class ForgotPassWordScreen extends StatefulWidget {
  const ForgotPassWordScreen({super.key});

  @override
  State<ForgotPassWordScreen> createState() => _ForgotPassWordScreenState();
}

class _ForgotPassWordScreenState extends State<ForgotPassWordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
                title: 'Forgot',
                onTap: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .then((value) {
                    Utils().toastMessage('Email Sent');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
