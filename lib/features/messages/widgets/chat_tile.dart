import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';
import 'package:whatsapp_clone/data/models/chat_item.dart';

class ChatTile extends StatelessWidget {
  final ChatItem item;
  final VoidCallback? onTap;
  const ChatTile({super.key, required this.item, this.onTap});

  String _formatTime(DateTime t) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(t.year, t.month, t.day);
    if (date == today) {
      final h = t.hour.toString().padLeft(2, '0');
      final m = t.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }
    if (date == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    }
    return '${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final secondary = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.textSecondaryDark
          : AppColors.textSecondaryLight,
    );

    Widget avatar = CircleAvatar(
      radius: 24,
      backgroundImage: item.avatarUrl.isNotEmpty
          ? (item.avatarUrl.startsWith('http')
              ? NetworkImage(item.avatarUrl)
              : AssetImage(item.avatarUrl) as ImageProvider)
          : const AssetImage('assets/images/img_placeholder.png'),
      backgroundColor: cs.surfaceContainerHighest,
    );

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: Insets.listTile,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(tag: 'hero_avatar_${item.id}', child: avatar),
            Gaps.md,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.subtitle,
                        ),
                      ),
                      Gaps.sm,
                      Text(_formatTime(item.time), style: AppTypography.caption),
                    ],
                  ),
                  Gaps.xs,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.body.copyWith(
                            color: item.muted
                                ? (Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight)
                                : null,
                          ),
                        ),
                      ),
                      if (item.pinned) ...[
                        Gaps.sm,
                        Icon(Icons.push_pin, size: 16, color: secondary?.color),
                      ],
                      if (item.unread > 0) ...[
                        Gaps.sm,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.badgeUnreadBg,
                            borderRadius: BorderRadius.circular(Spacing.lg),
                          ),
                          child: Text('${item.unread}',
                              style: AppTypography.overline.copyWith(
                                color: AppColors.badgeUnreadText,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}