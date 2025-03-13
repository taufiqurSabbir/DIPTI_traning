import 'package:dpit/home.dart';
import 'package:dpit/todo_list.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int page_index = 0;
  List pages = [
    Home(),
    TodoList(),
    Product(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page_index],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
          currentIndex: page_index,
          onTap: (int index){
            page_index = index;
            setState(() {

            });
          },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task),label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.network_cell),label: 'Api'),

        ],
      ),
    );
  }
}
