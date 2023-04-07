import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/message_format.dart';
import 'dart:io';
import '../models/chat_model';


class ChatRoom extends StatefulWidget {
  final Map<String, dynamic> userMap;
  final String chatRoomId;
  const ChatRoom({Key? key, required this.userMap, required this.chatRoomId}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _message = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream:
          _firestore.collection("users").doc(widget.userMap['uid']).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Container(
                child: Column(
                  children: [
                    Text(widget.userMap['email']),
                    Text(
                      "Online",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.25,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('chatroom').doc(widget.chatRoomId).collection('chats').orderBy("time", descending: false).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: ( context, index) {
                          Map<String, dynamic> map = snapshot.data?.docs[index].data() as Map<String, dynamic>;
                          ChatModel chatModel = ChatModel(messageType: map['sendby'] == _auth.currentUser?.email ? "sender" : "receiver", avatarUrl: "", time: "", name: map['email'] ?? "",  message: map['message']);
                          return Message(chatModel:  chatModel);
                        }
                    );
                  }
                  else {
                    return Container();
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                height: 61,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 5,
                                color: Colors.grey)
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.face,
                                  color: Colors.white60,
                                ),
                                onPressed: () {}),
                            Expanded(
                              child: TextField(
                                controller: _message,
                                cursorColor: Colors.white60,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: "Message",
                                  hintStyle: TextStyle(color: Colors.white60),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon:
                              Icon(Icons.photo_camera, color: Colors.white60),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.currency_rupee,
                                  color: Colors.white60),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon:
                              Icon(Icons.attach_file, color: Colors.white60),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey, shape: BoxShape.circle),
                      child: InkWell(
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                          onSendMessage();
                          _message.clear();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": FirebaseAuth.instance.currentUser!.email,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

}
