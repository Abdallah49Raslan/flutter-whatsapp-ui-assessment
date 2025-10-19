// lib/features/messages/views/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/messages/widgets/chat_appbar.dart';
import 'package:whatsapp_clone/features/messages/widgets/messages_list.dart';
import 'package:whatsapp_clone/features/messages/widgets/input_bar.dart';
import 'package:whatsapp_clone/data/models/message_item.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String title;
  final String avatarUrl;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.title,
    required this.avatarUrl,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<MessageItem> _items;

  @override
  void initState() {
    super.initState();
    // مؤقتًا من غير mock — هنوصل Firestore/Cubit بعدين
    _items = <MessageItem>[];
  }

  void _send() {
    // مؤقت — هنستبدله بنداء Cubit/Repo (sendText) بعد  خطوة الربط
    final now = DateTime.now();
    final newMsg = MessageItem(
      id: 'local_${now.microsecondsSinceEpoch}',
      chatId: widget.chatId,
      isMe: true,
      text: '...',
      timestamp: now,
      status: MessageStatus.sent,
    );
    setState(() => _items.add(newMsg));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        title: widget.title,
        avatarUrl: widget.avatarUrl,
      ),
      body: Column(
        children: [
          Expanded(child: MessagesList(items: _items)),
          InputBar(onSend: _send),
        ],
      ),
    );
  }
}
