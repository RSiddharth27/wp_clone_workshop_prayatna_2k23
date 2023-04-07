import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/message_format.dart';

import 'package:whatsapp_clone/models/chat_model';

class Chat extends StatefulWidget {
  final String name;
  final String avatar;
  final ChatModel chatModel;
  const Chat(
      {Key? key,
      required this.name,
      required this.avatar,
      required this.chatModel})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late String chat_data;
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.avatar),
                  maxRadius: 15,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        "Online",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.videocam, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.call, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: vandu.length,
              itemBuilder: (context, index){
              return Message(chatModel: vandu[index]);
          }),
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
                              controller: _textEditingController,
                              cursorColor: Colors.white60,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Message",
                                hintStyle: TextStyle(color: Colors.white60),
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                setState(() {
                                  chat_data=value;
                                });
                              },
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
                      onTap: (){
                        vandu.add(ChatModel(
                          name: "Mr. Vandu",
                          message: chat_data,
                          time: "15:30",
                          avatarUrl:
                          "https://pbs.twimg.com/profile_images/1000352327625195521/bFptdcKG_400x400.jpg",
                          messageType: "sender",
                        ));
                        setState(() {

                        });
                        _textEditingController.clear();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
