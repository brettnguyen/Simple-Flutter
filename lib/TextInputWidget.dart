// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class TextInputWidget extends StatefulWidget {
  Function(String) callback;
  TextInputWidget(this.callback, {super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidget();
}

class _TextInputWidget extends State<TextInputWidget> {
  final controller = TextEditingController();

  //FocusNode myFocusNode = FocusNode();
// dispose cleans widget when done
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        //focusNode: myFocusNode,
        onSubmitted: (value) => {
              click(), //myFocusNode.requestFocus()
            },
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.message,
              color: Colors.grey,
            ),
            labelText: "type a message",
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              splashColor: Colors.green,
              tooltip: "Post Message",
              onPressed: click,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(color: Colors.grey)),
        style: TextStyle(color: Colors.grey));
  }
}
