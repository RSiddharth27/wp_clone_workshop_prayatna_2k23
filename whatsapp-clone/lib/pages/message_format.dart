import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/chat_model';

class Message extends StatefulWidget {
  final ChatModel chatModel;
  const Message({Key? key, required this.chatModel}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.chatModel.messageType == "sender" ? 64.0 : 16.0,
        4,
        widget.chatModel.messageType == "sender" ? 16.0 : 64.0,
        4,
      ),
      child: Align(
        alignment: widget.chatModel.messageType == "sender"
            ? Alignment.topRight
            : Alignment.topLeft,
        child: DecoratedBox(
// chat bubble decoration
          decoration: BoxDecoration(
            color: widget.chatModel.messageType == "sender"
                ? Colors.grey
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              widget.chatModel.message,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: widget.chatModel.messageType == "sender"
                      ? Colors.white
                      : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
