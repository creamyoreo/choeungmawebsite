import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A small italic note flagging auto-generated copy, per the site owner's
/// request, so drafted sections are easy to spot and revise later.
class DraftNote extends StatelessWidget {
  const DraftNote({
    super.key,
    this.padding = const EdgeInsets.only(top: 12),
    this.onDark = false,
  });

  final EdgeInsets padding;

  /// Set true when placed on a dark background (e.g. the forest-green
  /// cards) so the note stays legible instead of blending in.
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        '(let me know how you want this changed — this is just a rough draft)',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: onDark
                  ? Colors.white.withValues(alpha: 0.55)
                  : AppColors.ink.withValues(alpha: 0.45),
              fontSize: 13,
            ),
      ),
    );
  }
}
