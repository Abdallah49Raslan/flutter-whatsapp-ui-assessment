import 'package:flutter/animation.dart';

import 'spacing.dart';

class AppConfig {

  static const Duration animFast = Duration(milliseconds: 150);
  static const Duration anim = Duration(milliseconds: 250);
  static const Duration animSlow = Duration(milliseconds: 400);

  // Curves
  static const Curve defaultCurve = Curves.easeInOut;

  static bool debugVisuals = false;
  static bool enableMotion = true;

  static const double cardRadius = Spacing.lg;

  static bool forceRtl = false;
}
