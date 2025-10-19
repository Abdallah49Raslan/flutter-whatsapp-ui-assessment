import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/typography.dart';

class HomeTabs extends StatelessWidget implements PreferredSizeWidget {
  const HomeTabs({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.brandGreen,
      labelStyle: AppTypography.subtitle,
      tabs: const [
        Tab(text: 'Chats', icon: Icon(Icons.chat_bubble)),
        Tab(text: 'Status', icon: Icon(Icons.radio_button_checked)),
      ],
    );
  }
}