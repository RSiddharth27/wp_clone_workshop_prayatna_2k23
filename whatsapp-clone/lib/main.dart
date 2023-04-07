import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/login.dart';
import 'package:whatsapp_clone/whatsapp_home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "WhatsApp",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff25D366)),
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}