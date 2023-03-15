// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testproject/BottomNavigation.dart';
import 'package:testproject/Login.dart';
import 'package:testproject/database.dart';
import 'MyHomePage.dart';
import 'post.dart';
// ignore_for_file: prefer_const_constructors

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;
  const PostList(this.listItems, this.user, {super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    setState(() {
      callBack();
    });
  }

  void delete(Function callBack) {
    setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
            color: Colors.grey,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                )),
                Row(children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(post.usersLiked.length.toString(),
                          style: TextStyle(fontSize: 20))),
                  IconButton(
                      onPressed: () => like(() => post.likePost(widget.user)),
                      color: post.usersLiked.contains(widget.user.uid)
                          ? Colors.green
                          : Colors.black,
                      icon: Icon(Icons.thumb_up_rounded)),
                  IconButton(
                      onPressed: () => {
                            setState(() {
                              post.dPost();
                            }),
                            Navigator.pop(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          LoginPage(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                )),
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          MyWidget(widget.user),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ))
                          },
                      color: Colors.black,
                      icon: Icon(Icons.delete)),
                ])
              ],
            ));
      },
    );
  }
}
