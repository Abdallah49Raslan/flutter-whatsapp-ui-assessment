// lib/features/messages/widgets/chat_appbar.dart
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String avatarUrl;
  final String? subtitle;

  const ChatAppBar({
    super.key,
    required this.title,
    required this.avatarUrl,
    this.subtitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ImageProvider avatarProvider = avatarUrl.startsWith('http')
        ? NetworkImage(avatarUrl)
        : AssetImage(avatarUrl) as ImageProvider;

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          Hero(
            tag: 'hero_avatar_$title',
            child: CircleAvatar(backgroundImage: avatarProvider),
          ),
          SizedBox(width: Spacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.subtitle),
              Text(subtitle ?? 'last seen recently', style: AppTypography.overline),
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
