import 'package:exe2flutterday6/TextBloc.dart';
import 'package:exe2flutterday6/postPage.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'TITLE', 
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description', 
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input URL', 
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 150.0),
                          child: MaterialButton(
                            minWidth: 180,
                            height: 60,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => postPage()));
                            },
                            color: Colors.blueGrey.shade500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              "Create a new post",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
              ),
            )            
          ),
          )
          ],
      ),
    );
  }
}


