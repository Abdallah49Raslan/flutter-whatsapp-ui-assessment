import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/screens/chat/chat_appbar.dart';
import 'package:whatsapp_clone/presentation/screens/chat/messages_list.dart';
import 'package:whatsapp_clone/presentation/widgets/input_bar.dart';
import 'package:whatsapp_clone/data/mock/messages_mock.dart';
import 'package:whatsapp_clone/data/models/message_item.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  const ChatScreen({super.key, required this.chatId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<MessageItem> _items;

  @override
  void initState() {
    super.initState();
    _items = messagesMock.where((m) => m.chatId == widget.chatId).toList();
  }

  void _send() {
    // نموذج بسيط لإضافة رسالة محلية
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
      appBar: ChatAppBar(chatId: widget.chatId),
      body: Column(
        children: [
          Expanded(child: MessagesList(items: _items)),
          InputBar(onSend: _send),
        ],
      ),
    );
  }
}