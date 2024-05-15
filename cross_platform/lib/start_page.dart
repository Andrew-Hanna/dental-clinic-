import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart';
import 'registration/registration_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late final PageController pageController;
  int pageNo = 0;
  late Timer carouselTimer;

  bool isEqualIndex(int index, int pageNo) {
    return index == pageNo;
  }

  Timer getTimer() => Timer.periodic(Duration(seconds: 3), (timer) {
        if (pageNo == 4) {
          pageNo = 0;
        }
        pageController.animateToPage(
          pageNo,
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
        );
        pageNo++;
      });

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    carouselTimer = getTimer();
  }

  @override
  void dispose() {
    pageController.dispose();
    carouselTimer.cancel(); // Ensure to cancel the timer as well
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Added to enable scrolling
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.8, // Adjust height based on the screen size
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      pageNo = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: Image.asset(
                          'assets/start/page$index.jpg',
                          fit: BoxFit.cover, // Ensure the image fits well
                        ));
                  },
                  itemCount: 4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: isEqualIndex(index, pageNo)
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(
                          255, 82, 191, 245), // Button text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegistrationPage()), // Navigate to the registration page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[700], // Button text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
