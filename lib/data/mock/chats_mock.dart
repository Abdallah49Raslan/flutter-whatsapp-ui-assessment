import 'package:collection/collection.dart';
import 'package:whatsapp_clone/data/models/chat_item.dart';

import '_helpers.dart';

// 12 chats covering: unread>0, muted, pinned, long text, emojis, edge cases.
final List<ChatItem> chatsMock = [
  ChatItem(
    id: 'c_001',
    name: 'Mariam Ali',
    avatarUrl: 'assets/avatars/mariam_ali.jpeg',
    lastMessage: 'تمام.. أشوفك بكرة ☕',
    time: nowMinus(hours: 1, minutes: 5),
    unread: 3,
    pinned: true,
  ),
  ChatItem(
    id: 'c_002',
    name: 'Dev Team',
    avatarUrl: 'assets/avatars/group_dev.jpeg',
    lastMessage: '[You]: pushed the hotfix to main ✅',
    time: nowMinus(hours: 2),
    unread: 0,
    pinned: true,
    muted: true,
  ),
  ChatItem(
    id: 'c_003',
    name: 'Ahmed Hassan',
    avatarUrl: 'assets/avatars/ahmed_hassan.jpeg',
    lastMessage: '😂😂😂',
    time: nowMinus(hours: 3, minutes: 40),
    unread: 1,
  ),
  ChatItem(
    id: 'c_004',
    name: 'Family Group',
    avatarUrl: 'assets/avatars/group_family.jpeg',
    lastMessage: 'العشا الساعة 8؟',
    time: nowMinus(days: 1, hours: 2),
    unread: 8,
    muted: true,
  ),
  ChatItem(
    id: 'c_005',
    name: 'Office HR',
    avatarUrl: 'assets/avatars/office_hr.jpeg',
    lastMessage: 'Please review the updated policy document.',
    time: nowMinus(days: 1, hours: 5),
    unread: 0,
  ),
  ChatItem(
    id: 'c_006',
    name: 'Bestie 💙',
    avatarUrl: 'assets/avatars/bestie.jpg',
    lastMessage: 'Send pics from the trip 🏝️',
    time: nowMinus(days: 2),
    unread: 2,
  ),
  ChatItem(
    id: 'c_007',
    name: 'Grocery',
    avatarUrl: 'assets/avatars/shop.jpeg',
    lastMessage: 'Invoice #2451 paid. Thanks!',
    time: nowMinus(days: 3, hours: 6),
  ),
  ChatItem(
    id: 'c_008',
    name: 'Coach',
    avatarUrl: 'assets/avatars/coach.jpeg',
    lastMessage: loremShort,
    time: nowMinus(days: 4),
    unread: 1,
  ),
  ChatItem(
    id: 'c_009',
    name: 'Delivery',
    avatarUrl: 'assets/avatars/delivery.webp',
    lastMessage: 'Out for delivery 🚚',
    time: nowMinus(days: 5, hours: 2),
    muted: true,
  ),
  ChatItem(
    id: 'c_010',
    name: 'Football Squad',
    avatarUrl: 'assets/avatars/group_ball.jpeg',
    lastMessage: 'Game moved to 9pm ⚽',
    time: nowMinus(days: 6),
    unread: 12,
  ),
  ChatItem(
    id: 'c_011',
    name: 'Sarah',
    avatarUrl: 'assets/avatars/sarah.jpeg',
    lastMessage: 'OK cool 👍',
    time: nowMinus(days: 7, hours: 4),
  ),
  ChatItem(
    id: 'c_012',
    name: 'Work Group',
    avatarUrl: 'assets/avatars/work_group.jpeg',
    lastMessage: 'Scroll up, I wrote a long explanation…',
    time: nowMinus(minutes: 30),
    unread: 5,
    pinned: false,
  ),
];

// Sort suggestion (optional): pinned first, then by time desc.
final List<ChatItem> chatsMockSorted = chatsMock.sorted((a, b) {
  if (a.pinned != b.pinned) return b.pinned ? 1 : -1; // pinned first
  return b.time.compareTo(a.time); // newest first
});
