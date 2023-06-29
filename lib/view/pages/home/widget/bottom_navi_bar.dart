import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/home_provider.dart';
import 'package:qrmenu/product/utility/durations.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: context.colorScheme.primary,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: PageDurations.min(),
        tabBackgroundColor: Colors.grey[100]!,
        color: context.colorScheme.surface.withOpacity(0.5),
        tabs: const [
          GButton(
            icon: Icons.food_bank_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.spa_outlined,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.wallet_outlined,
            text: 'Subscription',
          ),
          GButton(
            icon: Icons.business_outlined,
            text: 'Business',
          ),
        ],
        selectedIndex: value.currentIndex,
        onTabChange: (index) => value.changeCurrentIndex(index),
      ),
    );
  }
}
