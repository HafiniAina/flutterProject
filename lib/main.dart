import 'package:exe2flutterday6/TextBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exe2flutterday6/post_page.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}


class HomePage extends StatelessWidget {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://besquare-demo'),
  );
  final _textBloc = UserTextBloc();

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
                                      builder: (context) => PostPage(channel: channel,)));
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
  

