import 'package:meta/meta.dart';

enum MessageStatus { sent, delivered, seen }

@immutable
class MessageItem {
  final String id; // unique id per message
  final String chatId; // which chat/thread it belongs to
  final bool isMe; // true if current user is the sender
  final String text; // message text only (simple model)
  final DateTime timestamp; // when message was sent
  final MessageStatus status; // sent|delivered|seen

  const MessageItem({ 
    required this.id,
    required this.chatId,
    required this.isMe,
    required this.text,
    required this.timestamp,
    this.status = MessageStatus.sent,
  });
}