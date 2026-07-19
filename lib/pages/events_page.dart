import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/event.dart';
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
                  'A running list of the get-togethers and parties we host — what’s '
                  'coming up, and a look back at what we’ve already thrown.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const DraftNote(),
              ],
            ),
          ),
          Section(
            color: Colors.white,
            verticalPadding: 32,
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
          Section(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Past events', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  'A few evenings we’ve already hosted.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                for (final event in pastEvents) ...[
                  _PastEventCard(event: event),
                  const SizedBox(height: 40),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PastEventCard extends StatelessWidget {
  const _PastEventCard({required this.event});

  final PastEvent event;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final cover = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: isMobile ? 4 / 3 : 1,
        child: Image.asset(event.coverImage, fit: BoxFit.cover),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(event.title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _InfoChip(
              icon: Icons.calendar_today_rounded,
              label: event.dateLabel,
              flagged: event.dateNeedsEditing,
            ),
            if (event.timeLabel.isNotEmpty)
              _InfoChip(icon: Icons.schedule_rounded, label: event.timeLabel),
            if (event.location.isNotEmpty)
              _InfoChip(icon: Icons.place_rounded, label: event.location),
            if (event.priceLabel.isNotEmpty)
              _InfoChip(icon: Icons.confirmation_number_rounded, label: event.priceLabel),
          ],
        ),
        const SizedBox(height: 18),
        Text(event.description, style: Theme.of(context).textTheme.bodyLarge),
        if (event.dateNeedsEditing) const DraftNote(),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [cover, const SizedBox(height: 24), info],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: cover),
                  const SizedBox(width: 40),
                  Expanded(flex: 6, child: info),
                ],
              ),
        if (event.galleryImages.isNotEmpty) ...[
          const SizedBox(height: 20),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: event.galleryImages.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.asset(event.galleryImages[index], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label, this.flagged = false});

  final IconData icon;
  final String label;
  final bool flagged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: flagged ? AppColors.pinkLight : AppColors.cream,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.pinkLight, width: 1.5),
      ),
      // Bounded so a long label wraps to a second line instead of
      // overflowing when the Wrap gives this chip a narrow line.
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 260),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(icon, size: 16, color: AppColors.pinkDark),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
