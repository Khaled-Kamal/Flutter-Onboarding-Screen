import 'package:flutter/material.dart';

import 'package:teeest/components/colors.dart';
import 'package:teeest/components/onboord_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final Controller = onBoardingData();
  final pageController = PageController();
  int cur = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            body(),
            buildDots(),
            Button(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  // body
  Widget body() {
    return Expanded(
      child: Center(
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                cur = value;
              });
            },
            itemCount: Controller.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Controller.items[cur].Image),
                    Text(
                      Controller.items[cur].title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        Controller.items[cur].Description,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
  // Dots

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        Controller.items.length,
        (index) => AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: cur == index ? primaryColor : Colors.grey,
          ),
          height: 7.0,
          width: cur == index ? 30 : 10,
          duration: Duration(milliseconds: 700),
        ),
      ),
    );
  }

  //Button
  Widget Button() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 55,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      ),
      child: TextButton(
        onPressed: (){
          setState(() {
            cur!= Controller.items.length -1? cur++ : null;
          });
        },
        child: Text(cur== Controller.items.length -1? "Get started" : "Continue",
          style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
