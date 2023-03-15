// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testproject/BottomNavigation.dart';
import 'package:testproject/MyHomePage.dart';

import 'auth.dart';

// ignore_for_file: prefer_const_constructors

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200000),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Lottie.asset('assets/waves.json',
              fit: BoxFit.cover,
              animate: true,
              repeat: true,
              frameRate: FrameRate(120),
              controller: _controller)),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Body(),
      )
    ]);
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late FirebaseUser user;
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  // late String name;
  //TextEditingController controller = /TextEditingController();
  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    //name = controller.text;
    //this is navigation

    //this is navigation without animation but you need to create your own back button
    signInWithGoogle().then((user) => {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => MyWidget(user),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          )
        });
  }

  Widget googleloginButton() {
    return OutlinedButton(
      onPressed: click,
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(color: Colors.white)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Image(image: AssetImage('assets/googlelogo.png'), height: 15),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Sign in with Google',
                    style: TextStyle(color: Colors.white, fontSize: 18)))
          ],
        ),
      ),
    );
  }

  Widget usernameInput() {
    return Center(
        child: Container(
            width: 250.0,
            height: 50.0,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextField(
              controller: controller,
              //focusNode: myFocusNode,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.person, color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              ),
              style: TextStyle(color: Colors.white),
            )));
  }

  Widget passwordInput() {
    return Center(
        child: Container(
            width: 250.0,
            height: 50.0,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextField(
                controller: controller2,
                //focusNode: myFocusNode,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.password, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                ))));
  }

  Widget apptitle() {
    return Center(
      child: Text(
        "Simple",
        style: TextStyle(
            color: Colors.white, fontSize: 50.0, fontFamily: 'DancingScript'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        apptitle(),
        usernameInput(),
        passwordInput(),
        googleloginButton()
      ],
    );
  }
}
