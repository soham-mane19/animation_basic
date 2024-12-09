import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const  LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation> with TickerProviderStateMixin {
 late Animation<double> opacityanimation;
 late AnimationController controller;
 late Animation<Offset> trasition;
 late Animation<double> scaleAnimation;
@override
  void initState() {
     
   controller = AnimationController(
    
    duration: Duration(
      
      milliseconds: 1500),
    vsync: this);   
    opacityanimation = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    trasition = Tween<Offset>(begin: Offset(-1,-1),end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  scaleAnimation = Tween<double>(begin: 0,end: 1).animate(controller);
  controller.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             FadeTransition(
           opacity: opacityanimation,
               child: FlutterLogo(
                size: 100.0,
                           ),
             ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SlideTransition(
                position: trasition,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
