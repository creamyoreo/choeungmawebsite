import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Blank placeholder avatar for team members whose photo hasn't been
/// added yet — a soft silhouette on a tinted circle.
class SilhouetteAvatar extends StatelessWidget {
  const SilhouetteAvatar({super.key, this.size = 140});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.pinkLight,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Icon(
        Icons.person,
        size: size * 0.72,
        color: AppColors.pink.withValues(alpha: 0.55),
      ),
    );
  }
}
