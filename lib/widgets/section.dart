import 'package:flutter/material.dart';
import 'responsive.dart';

/// Consistent max-width, centered content block used by every page section.
class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    this.color,
    this.verticalPadding = 72,
  });

  final Widget child;
  final Color? color;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.pageHPadding(context),
        vertical: verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
