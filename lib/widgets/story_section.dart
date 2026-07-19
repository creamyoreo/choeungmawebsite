import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'responsive.dart';
import 'section.dart';

/// The ChoeungMa origin story — shared between the Home and About pages.
class StorySection extends StatelessWidget {
  const StorySection({super.key, this.color = Colors.white});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final body = Theme.of(context).textTheme.bodyLarge;

    return Section(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From Book Club to Social Salon',
            style: (isMobile
                    ? Theme.of(context).textTheme.headlineMedium
                    : Theme.of(context).textTheme.displayMedium)
                ?.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: 28),
          Text(
            'What began as a book club grew into something more. Beyond the pages, '
            'we found connection in the conversations, questions, and stories that '
            'unfolded among us. It was through these exchanges that we discovered '
            'the beauty of community.',
            style: body,
          ),
          const SizedBox(height: 20),
          Text(
            'In the heart of Orrussey, people from all corners of the world come '
            'together in one place. Different languages mingle and cultures '
            'intersect, all woven together by one humble object:',
            style: body,
          ),
          const SizedBox(height: 24),
          Text(
            'ជើងម៉ា (ChoeungMa).',
            style: GoogleFonts.notoSansKhmer(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.pinkDark,
            ),
          ),
          const SizedBox(height: 24),
          Text('Yet a chair is nothing without someone sitting in it.', style: body),
          const SizedBox(height: 20),
          Text(
            'At ChoeungMa, we hope to create a space where we allow each voice to '
            'be heard and every perspective to be met with curiosity and '
            'understanding.',
            style: body,
          ),
          const SizedBox(height: 20),
          Text(
            'We believe every stranger carries a world of experiences, stories we '
            'can relate to, lessons we can learn from, and ideas worth exploring.',
            style: body,
          ),
          const SizedBox(height: 20),
          Text(
            'So, please pull up a chair.',
            style: body?.copyWith(fontWeight: FontWeight.w600, color: AppColors.ink),
          ),
          const SizedBox(height: 8),
          Text(
            'We believe there is a seat for every story.',
            style: body?.copyWith(fontWeight: FontWeight.w600, color: AppColors.ink),
          ),
        ],
      ),
    );
  }
}
