import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class PostPage extends StatefulWidget {
  PostPage({required this.channel, Key? key}) : super(key: key);
  WebSocketChannel channel;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List savedPost = [];

  late WebSocketChannel channel;

  void get_Posts() {
    widget.channel.sink.add('{"type" : "get_posts}');
  }

  List _datalist = [];
  dynamic decodedPost;

  initState() {
    super.initState();
    channel.stream.listen((results) {
      decodedPost = jsonDecode(results);
      if (decodedPost['type'] == 'all_posts') {
        _datalist = decodedPost['data']['posts'];
        //print(ListPost);
      }
      setState(() {});
    });
    get_Posts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Posts Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              // child: ElevatedButton(
              //   child: const Text('Check Users Data'),
              //   onPressed: readJson,
              // ),
            ),

            // Display the data loaded from layout.json
            _datalist.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _datalist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10),
                            // padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                //     CircleAvatar(
                                //       radius: 30,
                                //       backgroundColor: Colors.transparent,
                                //       backgroundImage:
                                //           // (_datalist[index]["avatar"]
                                //           //         .isNotEmpty)
                                //           //     ? NetworkImage("avatar.jpg"):
                                //           NetworkImage((_datalist[index]
                                //                   ["avatar"] ??
                                //               "https://image.shutterstock.com/image-illustration/blank-man-profile-head-icon-260nw-1902600802.jpg")),
                                //     ),
                                //   ],
                                // ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: ClipRRect(child: Image.network("${_datalist[index]["image"]}"))
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          _datalist[index]["title"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          _datalist[index]["description"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // ignore: avoid_unnecessary_containers
                                      Container(
                                        child: Text(
                                          _datalist[index]["date"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text('Icon delete')),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2),
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[Text('Icon fav')],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
