import 'dart:async';

class UserTextBloc {
  final _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;
 

  dispose() {
    _textController.close();
  }

  updateText(String text) {
    // ignore: unnecessary_null_comparison
    if (text != null) {
      _textController.sink.add(text);
    }
  }
}