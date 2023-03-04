import 'package:flutter/material.dart';
import 'package:lanceme_up/ui/onboarding_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return OnboardingOne();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(98, 178, 70, 1),
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/images/logo1.png'),
              Image.asset('assets/images/logo2.png')
            ],
          ),
          SizedBox(height: 330),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text('Version 0.0.1',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          )
        ],
      ),
    ));
  }
}
