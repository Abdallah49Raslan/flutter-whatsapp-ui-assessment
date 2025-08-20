import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/models/chat_item.dart';
import 'package:whatsapp_clone/presentation/screens/home/chats_list.dart';
import 'package:whatsapp_clone/presentation/screens/home/home_appbar.dart';
import 'package:whatsapp_clone/presentation/screens/stories/stories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  void _openChat(BuildContext context, ChatItem item) {
    Navigator.of(context).pushNamed('/chat', arguments: item.id);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      ChatsList(onOpen: (it) => _openChat(context, it)),
      const StoriesScreen(),
    ];

    return Scaffold(
      appBar: const HomeAppBar(),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            label: 'Status',
          ),
        ],
      ),
    );
  }
}
