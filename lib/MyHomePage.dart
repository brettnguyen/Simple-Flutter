import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testproject/database.dart';
import 'post.dart';
import 'PostList.dart';
import 'TextInputWidget.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  const MyHomePage(this.user, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Post> posts = [];

  void newPost(String text) {
    var post = Post(text, widget.user.displayName);

    post.setId(savePost(post));
    setState(() {
      posts.add(post);
    });
  }

  void updatePosts() {
    getAllPosts().then((posts) => {
          setState(() {
            this.posts = posts;
          })
        });
  }

//updates when page loads
  @override
  void initState() {
    super.initState();
    updatePosts();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200000),
    );
    _controller.repeat();
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Simple"),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 28, fontFamily: 'DancingScript'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: PostList(posts.reversed.toList(), widget.user),
              ),
            ),
            TextInputWidget(newPost)
          ],
        ),
      )
    ]);
  }
}
