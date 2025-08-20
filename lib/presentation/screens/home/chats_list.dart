import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/widgets/chat_tile.dart';
import 'package:whatsapp_clone/data/mock/chats_mock.dart';
import 'package:whatsapp_clone/data/models/chat_item.dart';

class ChatsList extends StatelessWidget {
  final void Function(ChatItem) onOpen;
  const ChatsList({super.key, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final items = chatsMockSorted; // pinned أولاً ثم الأحدث
    return ListView.builder(
      key: const PageStorageKey('chats_list'),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final it = items[i];
        return ChatTile(item: it, onTap: () => onOpen(it));
      },
    );
  }
}