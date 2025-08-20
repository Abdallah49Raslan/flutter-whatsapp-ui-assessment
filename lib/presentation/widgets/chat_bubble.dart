import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';
import 'package:whatsapp_clone/data/models/message_item.dart';

class ChatBubble extends StatelessWidget {
  final MessageItem msg;
  // لتجميع الفقاعات بصريًا
  final bool isFirstInGroup;
  final bool isLastInGroup;
  const ChatBubble({
    super.key,
    required this.msg,
    this.isFirstInGroup = true,
    this.isLastInGroup = true,
  });

  Color _bg(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    if (msg.isMe) {
      return dark ? AppColors.chatOutgoingDark : AppColors.chatOutgoingLight;
    }
    return dark ? AppColors.chatIncomingDark : AppColors.chatIncomingLight;
  }

  BorderRadius _radius() {
    final r = Radius.circular(Spacing.lg);
    final small = Radius.circular(Spacing.md);
    if (msg.isMe) {
      return BorderRadius.only(
        topLeft: r,
        bottomLeft: r,
        topRight: isFirstInGroup ? r : small,
        bottomRight: isLastInGroup ? r : small,
      );
    } else {
      return BorderRadius.only(
        topRight: r,
        bottomRight: r,
        topLeft: isFirstInGroup ? r : small,
        bottomLeft: isLastInGroup ? r : small,
      );
    }
  }

  Widget _statusIcon(MessageStatus s, Color color) {
    switch (s) {
      case MessageStatus.sent:
        return Icon(Icons.check, size: 14, color: color);
      case MessageStatus.delivered:
        return Icon(Icons.done_all, size: 14, color: color);
      case MessageStatus.seen:
        return Icon(Icons.done_all, size: 14, color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeStyle = AppTypography.overline.copyWith(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.textSecondaryDark
          : AppColors.textSecondaryLight,
    );

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Container(
        padding: Insets.allMd,
        decoration: BoxDecoration(color: _bg(context), borderRadius: _radius()),
        child: Column(
          crossAxisAlignment: msg.isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            SelectableText(msg.text, style: AppTypography.body),
            Gaps.xs,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${msg.timestamp.hour.toString().padLeft(2, '0')}:${msg.timestamp.minute.toString().padLeft(2, '0')}',
                  style: timeStyle,
                ),
                if (msg.isMe) ...[
                  Gaps.xs,
                  _statusIcon(
                    msg.status,
                    msg.status == MessageStatus.seen
                        ? AppColors.brandGreen
                        : timeStyle.color ?? Colors.white,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );

    // ظهور لطيف عند إضافة رسالة جديدة
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Align(
        alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: TweenAnimationBuilder<double>(
          key: ValueKey(msg.id),
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          tween: Tween(begin: 0.9, end: 1),
          builder: (context, v, child) {
            return Opacity(
              opacity: v.clamp(0.0, 1.0),
              child: Transform.translate(
                offset: Offset((1 - v) * (msg.isMe ? 16 : -16), (1 - v) * 6),
                child: Transform.scale(scale: v, child: child),
              ),
            );
          },
          child: bubble,
        ),
      ),
    );
  }
}
