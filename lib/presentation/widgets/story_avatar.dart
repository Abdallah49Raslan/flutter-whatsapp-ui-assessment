import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';

class StoryAvatar extends StatelessWidget {
  final String avatarUrl;
  final String label;
  final bool viewed;
  final VoidCallback? onTap;
  const StoryAvatar({super.key, required this.avatarUrl, required this.label, required this.viewed, this.onTap});

  @override
  Widget build(BuildContext context) {
    final ringColor = viewed ? (Theme.of(context).brightness == Brightness.dark ? AppColors.dividerDark : AppColors.dividerLight) : AppColors.brandGreen;

    final imgProvider = avatarUrl.isNotEmpty
        ? (avatarUrl.startsWith('http') ? NetworkImage(avatarUrl) : AssetImage(avatarUrl) as ImageProvider)
        : const AssetImage('assets/images/img_placeholder.png');

    return Semantics(
      label: '$label story',
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ringColor, width: 2.5),
              ),
              child: CircleAvatar(radius: 28, backgroundImage: imgProvider),
            ),
            Gaps.sm,
            SizedBox(
              width: 72,
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTypography.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}