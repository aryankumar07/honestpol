import 'package:flutter/material.dart';
import 'package:honestpol/features/onborading/widget/pageviewscontainer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboradScreen extends StatefulWidget {
  static const String rouuteName = '/on-boardScreen';

  const OnboradScreen({super.key});

  @override
  State<OnboradScreen> createState() => _OnboradScreenState();
}

class _OnboradScreenState extends State<OnboradScreen> {


  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Pageviewscontainer(
                Imageurl: 'assets/images/hands.jpg', 
                text: 'One Vote One Value \n Embrace Equality',
                showButton: false,
              ),
              Pageviewscontainer(
                Imageurl: 'assets/images/speaker_logo.png', 
                text: 'Make Your Voice Heard',
                showButton: false,
              ),
              Pageviewscontainer(
                Imageurl: 'assets/images/key.png', 
                text: 'Become a Key Particpation in Your respective College \n Sigin to Continue', 
                showButton: true)
            ],
          ),
          Positioned(
            bottom: 100,
            left: MediaQuery.of(context).size.width/2-100,
            child: 
            Row(
              children: [
                TextButton(
                onPressed: (){
                  _pageController.jumpToPage(2);
                }, 
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )),
                SmoothPageIndicator(
                  effect: WormEffect(),
                  controller: _pageController, 
                  count: 3),
                TextButton(
                onPressed: (){
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 800), 
                    curve: Curves.easeIn);
                }, 
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}