
import 'package:whatsapp_clone/data/models/message_item.dart';

import '_helpers.dart';

// For simplicity we use increasing offsets from "now" so ordering stays natural.

List<MessageItem> _thread(String chatId) => <MessageItem>[
  MessageItem(
    id: '${chatId}_m01',
    chatId: chatId,
    isMe: false,
    text: 'Hey! Are you coming today?',
    timestamp: nowMinus(hours: 5, minutes: 10),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: '${chatId}_m02',
    chatId: chatId,
    isMe: true,
    text: 'On my way!',
    timestamp: nowMinus(hours: 5, minutes: 8),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: '${chatId}_m03',
    chatId: chatId,
    isMe: false,
    text: 'Great 👍',
    timestamp: nowMinus(hours: 5, minutes: 7),
    status: MessageStatus.seen,
  ),
];

final List<MessageItem> messagesMock = [
  ..._thread('c_001'),
  ..._thread('c_003'),
  ..._thread('c_004'),
  ..._thread('c_005'),
  ..._thread('c_006'),
  ..._thread('c_007'),
  ..._thread('c_008'),
  ..._thread('c_009'),
  ..._thread('c_010'),
  ..._thread('c_011'),

  // Special: many messages in c_012 (long thread + consecutive from same sender)
  MessageItem(
    id: 'c_012_m01',
    chatId: 'c_012',
    isMe: true,
    text: 'Kicking off the long thread here…',
    timestamp: nowMinus(hours: 2, minutes: 30),
    status: MessageStatus.delivered,
  ),
  MessageItem(
    id: 'c_012_m02',
    chatId: 'c_012',
    isMe: true,
    text: 'First, requirements:',
    timestamp: nowMinus(hours: 2, minutes: 29),
    status: MessageStatus.delivered,
  ),
  MessageItem(
    id: 'c_012_m03',
    chatId: 'c_012',
    isMe: true,
    text: '- Login\n- Messages\n- Stories\n- Calls',
    timestamp: nowMinus(hours: 2, minutes: 28),
    status: MessageStatus.delivered,
  ),
  MessageItem(
    id: 'c_012_m04',
    chatId: 'c_012',
    isMe: false,
    text: 'Following… can you share timelines?',
    timestamp: nowMinus(hours: 2, minutes: 26),
    status: MessageStatus.delivered,
  ),
  MessageItem(
    id: 'c_012_m05',
    chatId: 'c_012',
    isMe: true,
    text: 'Sure. Milestone 1 this week.',
    timestamp: nowMinus(hours: 2, minutes: 25),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m06',
    chatId: 'c_012',
    isMe: true,
    text: loremLong,
    timestamp: nowMinus(hours: 1, minutes: 50),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m07',
    chatId: 'c_012',
    isMe: false,
    text: 'Nice! 🔥',
    timestamp: nowMinus(hours: 1, minutes: 48),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m08',
    chatId: 'c_012',
    isMe: false,
    text: 'Let’s keep all updates here.',
    timestamp: nowMinus(hours: 1, minutes: 47),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m09',
    chatId: 'c_012',
    isMe: false,
    text: 'Also, can we add media upload later?',
    timestamp: nowMinus(hours: 1, minutes: 46),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m10',
    chatId: 'c_012',
    isMe: true,
    text: 'Yep, we can stage it behind a feature flag.',
    timestamp: nowMinus(hours: 1, minutes: 45),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m11',
    chatId: 'c_012',
    isMe: true,
    text: 'BTW, what’s the target device range?',
    timestamp: nowMinus(hours: 1, minutes: 44),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m12',
    chatId: 'c_012',
    isMe: false,
    text: 'iPhone 12 and up + Android 10+. Emoji test: 😅🚀✨',
    timestamp: nowMinus(hours: 1, minutes: 42),
    status: MessageStatus.seen,
  ),
  MessageItem(
    id: 'c_012_m13',
    chatId: 'c_012',
    isMe: true,
    text: 'Got it. Noted. 👍',
    timestamp: nowMinus(hours: 1, minutes: 41),
    status: MessageStatus.seen,
  ),
];