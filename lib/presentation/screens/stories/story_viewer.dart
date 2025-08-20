import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/data/models/story_item.dart';
import 'package:whatsapp_clone/presentation/widgets/story_progress_bar.dart';

class StoryViewer extends StatefulWidget {
  final StoryItem item;
  final int startIndex;
  const StoryViewer({super.key, required this.item, this.startIndex = 0});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late int _index;
  double _progress = 0; // 0..1
  Timer? _timer;
  bool _paused = false;

  StoryMediaItem get current => widget.item.items[_index];

  @override
  void initState() {
    super.initState();
    _index = widget.startIndex;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _progress = 0;
    final totalMs = current.durationMs;
    const tick = Duration(milliseconds: 33);
    _timer = Timer.periodic(tick, (tm) {
      if (_paused) return;
      setState(() {
        _progress += tick.inMilliseconds / totalMs;
        if (_progress >= 1) {
          _next();
        }
      });
    });
  }

  void _next() {
    if (_index < widget.item.items.length - 1) {
      setState(() {
        _index++;
        _startTimer();
      });
    } else {
      Navigator.of(context).maybePop();
    }
  }

  void _prev() {
    if (_index > 0) {
      setState(() {
        _index--;
        _startTimer();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imgProvider = current.imageUrl.startsWith('http')
        ? NetworkImage(current.imageUrl)
        : AssetImage(current.imageUrl) as ImageProvider;

    return GestureDetector(
      onTapUp: (d) {
        final w = MediaQuery.of(context).size.width;
        if (d.localPosition.dx > w / 2) {
          _next();
        } else {
          _prev();
        }
      },
      onLongPressStart: (_) => setState(() => _paused = true),
      onLongPressEnd: (_) => setState(() => _paused = false),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // انتقال لطيف بين الشرائح
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: KeyedSubtree(
                key: ValueKey(current.imageUrl),
                child: Image(
                  image: imgProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  StoryProgressBar(
                    total: widget.item.items.length,
                    index: _index,
                    progress: _progress.clamp(0, 1),
                  ),
                  Padding(
                    padding: Insets.h(Spacing.md),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: imgProvider,
                          radius: Spacing.sm,
                        ),
                        const SizedBox(width: Spacing.sm),
                        Expanded(
                          child: Text(
                            widget.item.userName,
                            style: const TextStyle(
                              color: AppColors.backgroundLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.backgroundLight,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
