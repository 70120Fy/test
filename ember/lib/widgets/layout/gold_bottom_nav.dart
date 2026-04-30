import 'package:flutter/material.dart';

class GoldBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItem> items;

  const GoldBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, -4),
            blur: 16,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        items: items.map((item) {
          return BottomNavigationBarItem(
            icon: item.icon,
            activeIcon: item.activeIcon ?? item.icon,
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}

class NavItem {
  final Widget icon;
  final Widget? activeIcon;
  final String label;

  NavItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });
}

class BottomNavBuilder extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBuilder({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GoldBottomNav(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        NavItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: 'Home',
        ),
        NavItem(
          icon: const Icon(Icons.book_outlined),
          activeIcon: const Icon(Icons.book),
          label: 'Programs',
        ),
        NavItem(
          icon: const Icon(Icons.analytics_outlined),
          activeIcon: const Icon(Icons.analytics),
          label: 'Insights',
        ),
      ],
    );
  }
}

class BottomNavBuilder4 extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBuilder4({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GoldBottomNav(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        NavItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: 'Home',
        ),
        NavItem(
          icon: const Icon(Icons.book_outlined),
          activeIcon: const Icon(Icons.book),
          label: 'Programs',
        ),
        NavItem(
          icon: const Icon(Icons.menu_book_outlined),
          activeIcon: const Icon(Icons.menu_book),
          label: 'Library',
        ),
        NavItem(
          icon: const Icon(Icons.analytics_outlined),
          activeIcon: const Icon(Icons.analytics),
          label: 'Insights',
        ),
      ],
    );
  }
}
