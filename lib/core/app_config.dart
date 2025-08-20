import 'package:flutter/animation.dart';
import 'spacing.dart';

/// إعدادات عامة للتطبيق
class AppConfig {
  // Durations (أنيميشن افتراضية)
  static const Duration animFast = Duration(milliseconds: 150);
  static const Duration anim = Duration(milliseconds: 250);
  static const Duration animSlow = Duration(milliseconds: 400);

  // Curves
  static const Curve defaultCurve = Curves.easeInOut;

  // Flags عامة
  static bool debugVisuals = false; // لتفعيل أدلة بصرية إضافية أثناء التطوير
  static bool enableMotion = true; // لتعطيل/تفعيل الحركة عالميًا إذا لزم

  // قياسات عامة (إن احتجت لاحقًا)
  static const double cardRadius = Spacing.lg; // نصف القطر القياسي للبطاقات

  // RTL logic (لاحقًا): يمكن استبدالها بقراءة الـ Locale من السياق
  // استخدمها مؤقتًا في الأماكن التي تحتاج فَرْض اتجاه
  static bool forceRtl = false;
}