import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/draft_note.dart';
import '../widgets/responsive.dart';
import '../widgets/section.dart';
import '../widgets/site_scaffold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SiteScaffold(
      currentPath: '/contact',
      child: Column(
        children: [
          Section(
            verticalPadding: isMobile ? 48 : 72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in touch',
                  style: (isMobile
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.displayLarge)
                      ?.copyWith(color: AppColors.ink),
                ),
                const SizedBox(height: 20),
                Text(
                  'Questions, ideas, or just want to say hi before your first event? '
                  'Reach out — we’d love to hear from you.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const DraftNote(),
              ],
            ),
          ),
          Section(
            color: Colors.white,
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _ContactCard(
                        icon: Icons.email_rounded,
                        title: 'Email',
                        value: 'hello@choeungma.org (to be edited)',
                        url: 'mailto:hello@choeungma.org',
                      ),
                      SizedBox(height: 20),
                      _ContactCard(
                        icon: Icons.camera_alt_rounded,
                        title: 'Instagram',
                        value: '@choeungma (to be edited)',
                        url: 'https://instagram.com/',
                      ),
                      SizedBox(height: 20),
                      _SafeSpaceCard(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: Column(
                          children: [
                            _ContactCard(
                              icon: Icons.email_rounded,
                              title: 'Email',
                              value: 'hello@choeungma.org (to be edited)',
                              url: 'mailto:hello@choeungma.org',
                            ),
                            SizedBox(height: 20),
                            _ContactCard(
                              icon: Icons.camera_alt_rounded,
                              title: 'Instagram',
                              value: '@choeungma (to be edited)',
                              url: 'https://instagram.com/',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 32),
                      Expanded(child: _SafeSpaceCard()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });

  final IconData icon;
  final String title;
  final String value;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.cream,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.pinkLight, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(color: AppColors.pinkLight, shape: BoxShape.circle),
              child: Icon(icon, color: AppColors.pinkDark),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SafeSpaceCard extends StatelessWidget {
  const _SafeSpaceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.forest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_rounded, color: Colors.white.withValues(alpha: 0.9)),
          const SizedBox(height: 16),
          Text(
            'Our safe space commitment',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            'Everyone who joins a Choeungma event agrees to treat others with respect — '
            'regardless of gender identity, sexual orientation, race, religion, or background. '
            'Harassment or discrimination of any kind isn’t tolerated. If something ever feels '
            'off at one of our events, please tell a member of the team.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                ),
          ),
          const DraftNote(onDark: true),
        ],
      ),
    );
  }
}
