import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/stories/widgets/story_avatar.dart';
import 'package:whatsapp_clone/data/models/story_item.dart';

class StoriesGrid extends StatelessWidget {
  final List<StoryItem> items;
  final void Function(StoryItem) onOpen;
  const StoriesGrid({super.key, required this.items, required this.onOpen});

  bool _isViewed(StoryItem s) => s.items.every((e) => e.viewed);

  @override
  Widget build(BuildContext context) {
    final sorted = [...items]
      ..sort((a, b) {
        final av = _isViewed(a);
        final bv = _isViewed(b);
        if (av != bv) return av ? 1 : -1; // غير مقروء أولاً
        return a.userName.compareTo(b.userName);
      });

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final it in sorted)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: StoryAvatar(
                avatarUrl: it.avatarUrl,
                label: it.userName,
                viewed: _isViewed(it),
                onTap: () => onOpen(it),
              ),
            ),
        ],
      ),
    );
  }
}