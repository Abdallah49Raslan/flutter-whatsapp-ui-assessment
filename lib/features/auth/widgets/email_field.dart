// lib/features/auth/widgets/email_field.dart
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  /// Label أعلى الحقل (افتراضي: "Email")
  final String label;

  /// نص مساعد داخل الحقل (placeholder)
  final String? hint;

  /// أكشن زر الإدخال في الكيبورد (next/done)
  final TextInputAction textInputAction;

  /// Validator اختياري (لاستخدام داخل Form)
  final String? Function(String?)? validator;

  /// استدعاء عند الضغط على "Next" أو "Done"
  final void Function(String)? onSubmitted;

  /// تركيز تلقائي؟
  final bool autofocus;

  const EmailField({
    super.key,
    required this.controller,
    this.label = 'Email',
    this.hint,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSubmitted,
    this.autofocus = false,
  });

  String? _defaultValidator(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Email is required';
    // Regex بسيط للتحقق من الصيغة
    const pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(v)) return 'Enter a valid email address';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTypography.caption;
    final bodyStyle = AppTypography.body;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        SizedBox(height: Spacing.xs),
        TextFormField(
          controller: controller,
          style: bodyStyle,
          autofocus: autofocus,
          autofillHints: const [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          validator: validator ?? _defaultValidator,
          decoration: InputDecoration(
            hintText: hint ?? 'example@email.com',
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
