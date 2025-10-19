// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/assets.dart';
import 'package:whatsapp_clone/core/colors.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';

class InputBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSend;
  final VoidCallback? onEmoji;
  final VoidCallback? onAttach;
  final VoidCallback? onCamera;
  final VoidCallback? onMic; // اختياري لتسجيل الصوت
  const InputBar({
    super.key,
    this.onChanged,
    this.onSend,
    this.onEmoji,
    this.onAttach,
    this.onCamera,
    this.onMic,
  });

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final _ctrl = TextEditingController();

  bool get _hasText => _ctrl.text.trim().isNotEmpty;

  void _handleSend() {
    if (!_hasText) return;
    widget.onSend?.call();
    _ctrl.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final secondary = Theme.of(context).brightness == Brightness.dark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return SafeArea(
      top: false,
      child: Padding(
        padding: Insets.h(
          Spacing.lg,
        ).copyWith(top: Spacing.sm, bottom: Spacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Spacing.sm,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(Spacing.xxl),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(AppIcons.emoji),
                      onPressed: widget.onEmoji,
                      tooltip: 'Emoji',
                    ),
                    Expanded(
                      child: TextField(
                        controller: _ctrl,
                        onChanged: (_) => setState(() {
                          widget.onChanged?.call(_ctrl.text);
                        }),
                        minLines: 1,
                        maxLines: 5,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Message',
                          hintStyle: AppTypography.subtitle.copyWith(
                            color: secondary,
                          ),
                        ),
                        style: AppTypography.subtitle,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(AppIcons.attach),
                      onPressed: widget.onAttach,
                      tooltip: 'Attach',
                    ),
                    IconButton(
                      icon: const Icon(AppIcons.camera),
                      onPressed: widget.onCamera,
                      tooltip: 'Camera',
                    ),
                  ],
                ),
              ),
            ),
            Gaps.sm,
            // زر الإرسال/الميك بنفس اللون دائمًا
            CircleAvatar(
              radius: 32.r,
              backgroundColor: cs.primary.withOpacity(0.12),
              child: IconButton(
                icon: Icon(_hasText ? AppIcons.send : AppIcons.mic),
                // نفس اللون في الحالتين
                color: AppColors.brandGreen,
                onPressed: _hasText ? _handleSend : (widget.onMic ?? () {}),
                tooltip: _hasText ? 'Send' : 'Voice',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
