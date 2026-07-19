import 'package:flutter/material.dart';
import '../models/team_member.dart';
import '../theme/app_theme.dart';
import '../widgets/draft_note.dart';
import '../widgets/responsive.dart';
import '../widgets/section.dart';
import '../widgets/silhouette_avatar.dart';
import '../widgets/site_scaffold.dart';
import '../widgets/story_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteScaffold(
      currentPath: '/about',
      child: Column(
        children: [
          _Intro(),
          StorySection(),
          _TeamSection(),
        ],
      ),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Section(
      verticalPadding: isMobile ? 48 : 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Choeungma',
            style: (isMobile
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayLarge)
                ?.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: 20),
          Text(
            'Choeungma is a community organization that hosts events and parties for friends '
            'and the community as a whole — including the LGBT+ community. We started with a '
            'simple idea: everyone deserves a space where they can show up as themselves, meet '
            'people who accept them, and just have fun.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'No matter your background, identity, or how you found us, you belong here. '
            'We’re committed to keeping our events safe, respectful, and genuinely welcoming '
            'for people of all kinds.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const DraftNote(),
        ],
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  const _TeamSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width < 620 ? 1 : (width < 900 ? 2 : 3);

    return Section(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Our team', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'The people behind Choeungma.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 36),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: teamMembers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              childAspectRatio: columns == 1 ? 2.6 : 0.78,
            ),
            itemBuilder: (context, index) => _TeamCard(member: teamMembers[index]),
          ),
          const DraftNote(),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({required this.member});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.pinkLight, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SilhouetteAvatar(),
          const SizedBox(height: 18),
          Text(
            member.name,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            member.role,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.pinkDark,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            TeamMember.pendingDescription,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.ink.withValues(alpha: 0.45),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Contact: ${TeamMember.pendingContact}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.ink.withValues(alpha: 0.45),
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
