import 'package:flutter/material.dart';
import 'package:wp_clone_test/pages/call_screen.dart';
import 'package:wp_clone_test/pages/camera_screen.dart';
import 'package:wp_clone_test/pages/chat_screen.dart';
import 'package:wp_clone_test/pages/status_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool show = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
        if(_tabController.index == 1) {
          show = true;
        } else {
          show = false;
        }
        setState(() {
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print("search");
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                print("options");
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CameraScreen(),
            ChatScreen(),
            StatusScreen(),
            CallScreen(),
          ],
        ),
        floatingActionButton: show ? FloatingActionButton(
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () => print("open chats"),
        ) : null
    );
  }
}
