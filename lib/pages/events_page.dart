import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/draft_note.dart';
import '../widgets/responsive.dart';
import '../widgets/section.dart';
import '../widgets/site_scaffold.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SiteScaffold(
      currentPath: '/events',
      child: Column(
        children: [
          Section(
            verticalPadding: isMobile ? 48 : 72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Events',
                  style: (isMobile
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.displayLarge)
                      ?.copyWith(color: AppColors.ink),
                ),
                const SizedBox(height: 20),
                Text(
                  'This is where we’ll list our upcoming get-togethers and parties. '
                  'We don’t have anything posted yet — check back soon, or get in touch '
                  'to be the first to hear when something’s announced.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const DraftNote(),
              ],
            ),
          ),
          Section(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppColors.pinkLight,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.event_available_rounded, color: AppColors.pinkDark, size: 36),
                  const SizedBox(height: 16),
                  Text(
                    'No upcoming events posted yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We’re working on it! In the meantime, reach out on the Contact page '
                    'and we’ll let you know what’s coming up.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.go('/contact'),
                    child: const Text('Contact us'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
