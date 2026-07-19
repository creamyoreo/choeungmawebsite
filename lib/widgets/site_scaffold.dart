import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import 'responsive.dart';

class NavItem {
  const NavItem(this.label, this.path);
  final String label;
  final String path;
}

const List<NavItem> navItems = [
  NavItem('Home', '/'),
  NavItem('About', '/about'),
  NavItem('Events', '/events'),
  NavItem('Contact', '/contact'),
];

/// Shared page chrome: responsive nav bar + footer, wrapped around every
/// page's content so navigation stays consistent site-wide.
class SiteScaffold extends StatelessWidget {
  const SiteScaffold({super.key, required this.currentPath, required this.child});

  final String currentPath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: _NavBar(currentPath: currentPath, isMobile: isMobile),
      endDrawer: isMobile ? _NavDrawer(currentPath: currentPath) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget implements PreferredSizeWidget {
  const _NavBar({required this.currentPath, required this.isMobile});

  final String currentPath;
  final bool isMobile;

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 76,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.pageHPadding(context)),
        child: Row(
          children: [
            InkWell(
              onTap: () => context.go('/'),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo_small.jpg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Choeungma',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (!isMobile)
              Row(
                children: [
                  for (final item in navItems) _NavLink(item: item, currentPath: currentPath),
                  const SizedBox(width: 8),
                ],
              ),
          ],
        ),
      ),
      actions: isMobile
          ? [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
              const SizedBox(width: 8),
            ]
          : null,
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.item, required this.currentPath});

  final NavItem item;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final active = item.path == currentPath;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        key: Key('navlink-${item.path}'),
        onPressed: () => context.go(item.path),
        style: TextButton.styleFrom(
          foregroundColor: active ? AppColors.pink : AppColors.ink,
          textStyle: TextStyle(
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        child: Text(item.label),
      ),
    );
  }
}

class _NavDrawer extends StatelessWidget {
  const _NavDrawer({required this.currentPath});

  final String currentPath;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cream,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            for (final item in navItems)
              ListTile(
                title: Text(
                  item.label,
                  style: TextStyle(
                    fontWeight: item.path == currentPath ? FontWeight.w700 : FontWeight.w500,
                    color: item.path == currentPath ? AppColors.pink : AppColors.ink,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  context.go(item.path);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.forest,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.pageHPadding(context),
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choeungma',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'A safe space for friends and the community — everyone welcome.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 8,
            children: [
              for (final item in navItems)
                TextButton(
                  onPressed: () => context.go(item.path),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white.withValues(alpha: 0.85),
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(item.label),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} Choeungma. This site is a rough draft — content and design are subject to change.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
