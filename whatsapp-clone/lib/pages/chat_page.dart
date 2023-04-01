import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String name;
  final String avatar;
  const Chat({Key? key, required this.name, required this.avatar})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
                  icon:
                  Icon(Icons.videocam, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                  Icon(Icons.call, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                  Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
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
                          const Expanded(
                            child: TextField(
                              cursorColor: Colors.white60,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
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
                            icon:
                            Icon(Icons.currency_rupee, color: Colors.white60),
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
                        Icons.keyboard_voice,
                        color: Colors.white,
                      ),
                      onLongPress: () {},
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
