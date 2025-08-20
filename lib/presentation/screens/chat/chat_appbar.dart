import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';
import 'package:whatsapp_clone/data/mock/chats_mock.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String chatId;
  const ChatAppBar({super.key, required this.chatId});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final chat = chatsMock.firstWhere((c) => c.id == chatId);
    final avatarProvider = chat.avatarUrl.startsWith('http')
        ? NetworkImage(chat.avatarUrl)
        : AssetImage(chat.avatarUrl) as ImageProvider;

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      // تقليل المسافة بين زر الرجوع والعنوان
      titleSpacing: 0,
      title: Row(
        children: [
          Hero(
            tag: 'hero_avatar_${chat.id}',
            child: CircleAvatar(backgroundImage: avatarProvider),
          ),
          // قللت المسافة هنا
          SizedBox(width: Spacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chat.name, style: AppTypography.subtitle),
              Text('last seen recently', style: AppTypography.overline),
            ],
          ),
        ],
      ),
      actions: const [
        Icon(Icons.videocam),
        SizedBox(width: 8),
        Icon(Icons.call),
        SizedBox(width: 8),
        Icon(Icons.more_vert),
        SizedBox(width: 8),
      ],
    );
  }
}
