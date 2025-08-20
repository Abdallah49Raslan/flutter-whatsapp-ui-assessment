import 'package:meta/meta.dart';

@immutable
class ChatItem {
  final String id; // unique chat/thread id
  final String name; // display name
  final String avatarUrl; // network/local asset path
  final String lastMessage; // last message preview
  final DateTime time; // last message time
  final int unread; // count of unread messages
  final bool pinned; // pinned chat
  final bool muted; // notifications muted

  const ChatItem({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,
    this.unread = 0,
    this.pinned = false,
    this.muted = false,
  });

  ChatItem copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    String? lastMessage,
    DateTime? time,
    int? unread,
    bool? pinned,
    bool? muted,
  }) => ChatItem(
        id: id ?? this.id,
        name: name ?? this.name,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        lastMessage: lastMessage ?? this.lastMessage,
        time: time ?? this.time,
        unread: unread ?? this.unread,
        pinned: pinned ?? this.pinned,
        muted: muted ?? this.muted,
      );
}