import 'package:meta/meta.dart';

@immutable
class StoryMediaItem {
  final String imageUrl; // could be network or asset path
  final int durationMs; // how long to show this media
  final bool viewed; // whether current user viewed it

  const StoryMediaItem({
    required this.imageUrl,
    required this.durationMs,
    this.viewed = false,
  });
}

@immutable
class StoryItem {
  final String id; // unique story id (usually user id)
  final String userName;
  final String avatarUrl;
  final List<StoryMediaItem> items; // ordered media items

  const StoryItem({
    required this.id,
    required this.userName,
    required this.avatarUrl,
    required this.items,
  });
}