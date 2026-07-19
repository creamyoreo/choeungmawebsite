import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/draft_note.dart';
import '../widgets/responsive.dart';
import '../widgets/section.dart';
import '../widgets/site_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      currentPath: '/',
      child: Column(
        children: [
          const _Hero(),
          const _StorySection(),
          const _ValuesSection(),
          const _WhatWeDoSection(),
          const _CtaSection(),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final textCol = Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.pinkLight,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              'A space for everyone — friends, allies & the LGBT+ community',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.pinkDark,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Come as you are.\nLeave with new friends.',
            style: (isMobile
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayLarge)
                ?.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: 20),
          Text(
            'Choeungma hosts events and parties for friends and the wider community, '
            'including the LGBT+ community. We’re building a safe, welcoming space '
            'where people of all kinds can meet, make friends, and have fun — no matter '
            'who you are or who you love.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/events'),
                child: const Text('See upcoming events'),
              ),
              OutlinedButton(
                onPressed: () => context.go('/about'),
                child: const Text('Meet the team'),
              ),
            ],
          ),
          const DraftNote(),
        ],
      ),
    );

    final imageCol = Expanded(
      flex: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
        ),
      ),
    );

    return Section(
      verticalPadding: isMobile ? 48 : 88,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: Image.asset('assets/images/logo.jpg', fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.pinkLight,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        'A space for everyone — friends, allies & the LGBT+ community',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.pinkDark,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Come as you are.\nLeave with new friends.',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.ink),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Choeungma hosts events and parties for friends and the wider community, '
                      'including the LGBT+ community. We’re building a safe, welcoming space '
                      'where people of all kinds can meet, make friends, and have fun — no matter '
                      'who you are or who you love.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.go('/events'),
                          child: const Text('See upcoming events'),
                        ),
                        OutlinedButton(
                          onPressed: () => context.go('/about'),
                          child: const Text('Meet the team'),
                        ),
                      ],
                    ),
                    const DraftNote(),
                  ],
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [textCol, const SizedBox(width: 56), imageCol],
            ),
    );
  }
}

class _StorySection extends StatelessWidget {
  const _StorySection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final body = Theme.of(context).textTheme.bodyLarge;

    return Section(
      color: Colors.white,
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

class _ValueCard {
  const _ValueCard(this.icon, this.title, this.body);
  final IconData icon;
  final String title;
  final String body;
}

const _values = [
  _ValueCard(
    Icons.favorite_rounded,
    'Safe & welcoming',
    'Everyone is respected here, regardless of gender identity, sexuality, background, or how new you are to the group.',
  ),
  _ValueCard(
    Icons.celebration_rounded,
    'Fun first',
    'Parties, hangouts, and community events designed to help people relax, laugh, and genuinely enjoy themselves.',
  ),
  _ValueCard(
    Icons.diversity_3_rounded,
    'Real community',
    'Not just one-off parties — we’re building lasting friendships and a support network for the people who show up.',
  ),
];

class _ValuesSection extends StatelessWidget {
  const _ValuesSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What we stand for', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          isMobile
              ? Column(
                  children: [
                    for (final v in _values) ...[
                      _ValueTile(v),
                      const SizedBox(height: 24),
                    ],
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final v in _values) ...[
                      Expanded(child: _ValueTile(v)),
                      if (v != _values.last) const SizedBox(width: 40),
                    ],
                  ],
                ),
          const DraftNote(),
        ],
      ),
    );
  }
}

class _ValueTile extends StatelessWidget {
  const _ValueTile(this.value);
  final _ValueCard value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: AppColors.pinkLight,
            shape: BoxShape.circle,
          ),
          child: Icon(value.icon, color: AppColors.pinkDark),
        ),
        const SizedBox(height: 16),
        Text(value.title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(value.body, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _WhatWeDoSection extends StatelessWidget {
  const _WhatWeDoSection();

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What we do', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          Text(
            'Choeungma organizes get-togethers, parties, and casual meetups throughout the year '
            '— from small hangouts to bigger community celebrations. Whether you’re looking to make '
            'new friends, find people who get you, or just want a fun night out in a space that '
            'genuinely accepts you, there’s a place for you here.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const DraftNote(),
        ],
      ),
    );
  }
}

class _CtaSection extends StatelessWidget {
  const _CtaSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Section(
      color: AppColors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Want to come hang out?',
            style: (isMobile
                    ? Theme.of(context).textTheme.headlineMedium
                    : Theme.of(context).textTheme.displayMedium)
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            'Check out our upcoming events, or reach out if you have questions — we’d love to meet you.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.pink,
                ),
                onPressed: () => context.go('/events'),
                child: const Text('See upcoming events'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 1.5),
                ),
                onPressed: () => context.go('/contact'),
                child: const Text('Get in touch'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
