import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/models/message_item.dart';
import 'package:whatsapp_clone/presentation/widgets/chat_bubble.dart';

class MessagesList extends StatelessWidget {
  final List<MessageItem> items;
  const MessagesList({super.key, required this.items});

  bool _sameSender(MessageItem a, MessageItem b) => a.isMe == b.isMe;
  bool _closeInTime(MessageItem a, MessageItem b) =>
      (a.timestamp.difference(b.timestamp).inMinutes).abs() <= 5;

  @override
  Widget build(BuildContext context) {
    final sorted = [...items]
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: sorted.length,
      itemBuilder: (context, i) {
        final msg = sorted[sorted.length - 1 - i]; // لأن reverse=true
        // حدّد التجاور بالنسبة للرسائل المجاورة بعد القلب
        MessageItem? prev; // الأقدم منه مباشرة
        MessageItem? next; // الأحدث منه مباشرة
        final idx = sorted.indexOf(msg);
        if (idx > 0) prev = sorted[idx - 1];
        if (idx < sorted.length - 1) next = sorted[idx + 1];

        final isFirstInGroup =
            prev == null || !_sameSender(prev, msg) || !_closeInTime(prev, msg);
        final isLastInGroup =
            next == null || !_sameSender(next, msg) || !_closeInTime(next, msg);

        return ChatBubble(
          msg: msg,
          isFirstInGroup: isFirstInGroup,
          isLastInGroup: isLastInGroup,
        );
      },
    );
  }
}
