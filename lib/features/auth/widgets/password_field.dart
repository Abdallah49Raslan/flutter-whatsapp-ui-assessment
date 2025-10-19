// lib/features/auth/widgets/password_field.dart
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  /// نص الليبل فوق الحقل
  final String label;

  /// نص مساعد/placeholder (اختياري)
  final String? hint;

  /// أكشن زر الإدخال في الكيبورد (next/done)
  final TextInputAction textInputAction;

  /// استدعاء عند الضغط على Done في الكيبورد
  final void Function(String)? onSubmitted;

  /// Validator اختياري لاستخدامه داخل Form
  final String? Function(String?)? validator;

  /// أقل طول (لو عايز تتحقق منه ضمنيًا)
  final int minLength;

  /// تلقائي التركيز؟
  final bool autofocus;

  const PasswordField({
    super.key,
    required this.controller,
    this.label = 'Password',
    this.hint,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.validator,
    this.minLength = 6,
    this.autofocus = false,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  String? _defaultValidator(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Password is required';
    if (v.length < widget.minLength) {
      return 'Password must be at least ${widget.minLength} characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTypography.caption; // استخدم ستايل من core
    final bodyStyle = AppTypography.body;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label أعلى الحقل (متوافق مع نظام الكتابة في المشروع)
        Text(widget.label, style: labelStyle),
        SizedBox(height: Spacing.xs),

        TextFormField(
          controller: widget.controller,
          style: bodyStyle,
          autofocus: widget.autofocus,
          obscureText: _obscure,
          enableSuggestions: false,
          autocorrect: false,
          autofillHints: const [AutofillHints.password],
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator ?? _defaultValidator,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: const OutlineInputBorder(),
            // زر إظهار/إخفاء الباسورد
            suffixIcon: IconButton(
              tooltip: _obscure ? 'Show password' : 'Hide password',
              icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),
        ),
      ],
    );
  }
}
