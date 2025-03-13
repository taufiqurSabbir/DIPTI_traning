import 'package:dpit/state_test.dart';
import 'package:dpit/todo.dart';
import 'package:dpit/todo_list.dart';
import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'home.dart';
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'class',

        home: BottomNav()
    );
  }
}


