import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

const String _name = "Your Name";

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      }, // 외부 화면 클릭시 키보드 숨김
      child: MaterialApp(
        title: "ChatApp",
        home: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text("방구석"),
            )
          : AppBar(
              title: Text("방구석"),
            ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Platform.isIOS
                    ? CupertinoTextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        placeholder: "메세지를 입력하세요",
                      )
                    : TextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: new InputDecoration.collapsed(
                            hintText: "메세지를 입력하세요"),
                      ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text)),
              ),
            ],
          )),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    var message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text}); //채팅 메시지를 나타내주는 위젯

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        //수직 축 따라 가장 높은 위치 제공
        crossAxisAlignment: CrossAxisAlignment.start, // 메시지를 상위 위젯에 상대적으로 배치
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, //가로 축 따라 왼쪽 텍스트 정렬
            children: <Widget>[
              Text(_name, style: Theme.of(context).textTheme.subtitle1),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text), // 메시지를 보낸 사용자를 나타내는 위젯 및 메시지를 표시하는 Row위젯 리턴
              ),
            ],
          ),
        ],
      ),
    );
  }
}
