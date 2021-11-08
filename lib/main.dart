import 'package:exe2flutterday6/TextBloc.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:exe2flutterday6/postPage.dart';

void main() {
  runApp(MyApp());
}


class HomePage extends StatelessWidget {
  final channel = WebSocketChannel.connect(
    Uri.parsel('ws://besquare-demo')
  )
}
  


class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ButtonWidget());
  }
}

// ignore: use_key_in_widget_constructors
class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final _textBloc = UserTextBloc();
  //TextEditingController _titleController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Please enter your username'),
        ),
        body: Column(
          children: [
            StreamBuilder(
                stream: _textBloc.textStream,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return Column(
                    children: [
                      TextField(
                        onChanged: (String text) => _textBloc.updateText(text),
                      ),
                      // child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      Container(
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
                              "Enter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ))

                      //tooltip: 'Show me the value!',
                    ],
                  );
                }),
          ],
        ));
  }
}
