import 'package:whatsapp_clone/data/models/story_item.dart';

final List<StoryItem> storiesMock = [
  StoryItem(
    id: 's_001',
    userName: 'You',
    avatarUrl: 'assets/avatars/me.jpeg',
    items: const [
      StoryMediaItem(
        imageUrl: 'assets/stories/me_1.jpeg',
        durationMs: 3500,
        viewed: true,
      ),
      StoryMediaItem(
        imageUrl: 'assets/stories/me_2.png',
        durationMs: 3500,
        viewed: true,
      ),
    ],
  ),
  StoryItem(
    id: 's_002',
    userName: 'Mariam Ali',
    avatarUrl: 'assets/avatars/mariam_ali.jpeg',
    items: const [
      StoryMediaItem(
        imageUrl: 'assets/stories/coffee.jpeg',
        durationMs: 4000,
        viewed: false,
      ),
    ],
  ),
  StoryItem(
    id: 's_003',
    userName: 'Ahmed Hassan',
    avatarUrl: 'assets/avatars/ahmed_hassan.jpeg',
    items: const [
      StoryMediaItem(
        imageUrl: 'assets/stories/gym.jpg',
        durationMs: 3500,
        viewed: false,
      ),
      StoryMediaItem(
        imageUrl: 'assets/stories/steps.jpg',
        durationMs: 3500,
        viewed: false,
      ),
    ],
  ),
  StoryItem(
    id: 's_004',
    userName: 'Bestie 💙',
    avatarUrl: 'assets/avatars/bestie.jpg',
    items: const [
      StoryMediaItem(
        imageUrl: 'assets/stories/travel.jpeg',
        durationMs: 5000,
        viewed: false,
      ),
    ],
  ),
  StoryItem(
    id: 's_005',
    userName: 'Coach',
    avatarUrl: 'assets/avatars/coach.jpeg',
    items: const [
      StoryMediaItem(
        imageUrl: 'assets/stories/run.jpg',
        durationMs: 3000,
        viewed: true,
      ),
      StoryMediaItem(
        imageUrl: 'assets/stories/timer.jpeg',
        durationMs: 3000,
        viewed: true,
      ),
      StoryMediaItem(
        imageUrl: 'assets/stories/swimming.jpeg',
        durationMs: 3000,
        viewed: true,
      ),
    ],
  ),
  StoryItem(
    id: 's_006',
    userName: 'Sarah',
    avatarUrl: 'assets/avatars/sarah.jpeg',
    items: const [
      StoryMediaItem(
        imageUrl: 'assets/stories/sky.jpeg',
        durationMs: 4000,
        viewed: false,
      ),
    ],
  ),
];
