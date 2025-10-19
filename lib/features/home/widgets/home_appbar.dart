import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/assets.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('WhatsApp', style: AppTypography.title),
      centerTitle: false,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: Spacing.xl),
          child: Icon(AppIcons.camera),
        ),
        Padding(
          padding: EdgeInsets.only(right: Spacing.sm),
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
