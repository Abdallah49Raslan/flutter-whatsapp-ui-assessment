import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/models/story_item.dart';
import 'package:whatsapp_clone/features/stories/widgets/stories_grid.dart';
import 'package:whatsapp_clone/features/stories/widgets/story_viewer.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  void _open(BuildContext context, StoryItem it) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => StoryViewer(item: it, startIndex: 0),
        transitionsBuilder: (_, anim, __, child) {
          final curved = CurvedAnimation(parent: anim, curve: Curves.easeOut);
          return FadeTransition(opacity: curved, child: child);
        },
        transitionDuration: const Duration(milliseconds: 180),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoriesGrid(items: [], onOpen: (it) => _open(context, it));
  }
}
