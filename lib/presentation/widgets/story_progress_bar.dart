import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/spacing.dart';

class StoryProgressBar extends StatelessWidget {
  final int total;
  final int index;
  final double progress; // 0..1 for current segment
  const StoryProgressBar({super.key, required this.total, required this.index, required this.progress});

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).brightness == Brightness.dark ? AppColors.dividerDark : AppColors.dividerLight;
    final fill = AppColors.brandGreen;

    return Padding(
      padding: Insets.h(Spacing.md),
      child: Row(
        children: List.generate(total, (i) {
          final isCurrent = i == index;
          final filled = i < index;
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: i == total - 1 ? 0 : Spacing.xs),
              height: 3,
              decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(2)),
              child: Stack(
                children: [
                  if (filled || isCurrent)
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: filled ? 1 : progress.clamp(0, 1),
                      child: Container(decoration: BoxDecoration(color: fill, borderRadius: BorderRadius.circular(2))),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}