// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testproject/Login.dart';
import 'package:testproject/auth.dart';
import 'package:lottie/lottie.dart';

class profile extends StatefulWidget {
  const profile({super.key});
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with SingleTickerProviderStateMixin {
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
          appBar: AppBar(
            title: const Text("Simple"),
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 28, fontFamily: 'DancingScript'),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [Spacer(), Userface(), Body(), Spacer()],
          ))
    ]);
  }
}

class Userface extends StatefulWidget {
  const Userface({super.key});

  @override
  State<Userface> createState() => _UserfaceState();
}

class _UserfaceState extends State<Userface> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        IconButton(
            onPressed: null,
            iconSize: 90,
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey,
            )),
      ],
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void leave() {
    signOutGoogle();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => LoginPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              onPressed: leave,
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
              child: Text('Logout'),
            )
          ],
        ));
  }
}
