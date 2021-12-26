import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return  ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) =>  Column(
            children: <Widget>[
               const Divider(
                height: 10.0,
              ),
               ListTile(
                leading:  CircleAvatar(
                  backgroundImage:  NetworkImage(dummyData[i].avatarUrl),
                ),
                title:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Text(
                      dummyData[i].name,
                      style:  const TextStyle(fontWeight: FontWeight.bold),
                    ),
                     Text(
                      dummyData[i].time,
                      style:  const TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle:  Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child:  Text(
                    dummyData[i].message,
                    style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
