// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:testproject/database.dart';

class Post {
  late String body;
  late String author;
  late String postid;
  Set usersLiked = {};
  late DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(FirebaseUser user) {
    if (usersLiked.contains(user.uid)) {
      usersLiked.remove(user.uid);
    } else {
      usersLiked.add(user.uid);
    }
    update();
  }

  void dPost() {
    databaseReference.child('posts/').child(_id.key).remove();
    print(_id.key);
  }

  void update() {
    updatePost(this, _id);
  }

  void setId(DatabaseReference id) {
    _id = id;
  }

  Map<String, dynamic> toJson() {
    return {'author': author, 'usersLiked': usersLiked.toList(), 'body': body};
  }
}
