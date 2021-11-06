import 'package:exe2flutterday6/TextBloc.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';


class createPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post Page'),
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 200,
          height: 200,
          color:Colors.lightBlueAccent),
      ),
    );
  }
}


