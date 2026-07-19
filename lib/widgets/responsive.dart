import 'package:flutter/widgets.dart';

class Responsive {
  Responsive._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 760;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 760;

  /// Horizontal page padding that grows with the viewport, capped so
  /// content never stretches edge-to-edge on very wide screens.
  static double pageHPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 760) return 20;
    if (width < 1100) return 48;
    return (width - 1100) / 2 + 48;
  }

  static const double maxContentWidth = 1100;
}
