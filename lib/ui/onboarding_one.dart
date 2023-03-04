import 'package:flutter/material.dart';

import 'package:lanceme_up/firebase_services/splash_services.dart';
import 'package:lanceme_up/widgets/round_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  final controller = PageController();
  bool isLastPage = false;
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(bottom: 300, top: 80, right: 50, left: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 3);
            },
            children: [
              Container(
                color: Color.fromRGBO(213, 218, 225, 1),
                child: Center(
                    child: const Text(
                  'img',
                  style: TextStyle(
                      color: Color.fromRGBO(15, 14, 19, 1), fontSize: 128),
                )),
              ),
              Container(
                color: Color.fromRGBO(213, 218, 225, 1),
                child: Center(
                    child: const Text(
                  'img',
                  style: TextStyle(
                      color: Color.fromRGBO(15, 14, 19, 1), fontSize: 128),
                )),
              ),
              Container(
                color: Color.fromRGBO(213, 218, 225, 1),
                child: Center(
                    child: const Text(
                  'img',
                  style: TextStyle(
                      color: Color.fromRGBO(15, 14, 19, 1), fontSize: 128),
                )),
              ),
              Container(
                color: Color.fromRGBO(213, 218, 225, 1),
                child: Center(
                    child: const Text(
                  'img',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 14, 19, 1),
                    fontSize: 128,
                  ),
                )),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Lorem Ipsum?',
              style: TextStyle(
                  color: Color.fromRGBO(15, 14, 19, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Lorem ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(
                color: Color.fromRGBO(15, 14, 19, 1),
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: ExpandingDotsEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                spacing: 8,
                dotColor: Color.fromRGBO(187, 195, 207, 1),
                activeDotColor: Color.fromRGBO(98, 178, 70, 1),
              ),
            ),
            isLastPage
                ? RoundButton(
                    title: 'Get Started',
                    onTap: () async {
                      splashScreen.isLogin(context);
                    })
                : Column(
                    children: [
                      RoundButton(
                          title: 'Next',
                          onTap: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut)),
                      Center(
                        child: TextButton(
                            onPressed: () => controller.jumpToPage(3),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: Color.fromRGBO(98, 178, 70, 1),
                                fontSize: 20,
                              ),
                            )),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
