import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart' hide GoRouterHelper;
import 'package:test_app/core/navigation/app_routes.dart';
import 'package:test_app/core/navigation/navigation_service.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/app_icons.dart';
import 'package:test_app/core/utils/extensions.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: context.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor),
      unselectedLabelStyle: context.textTheme.titleSmall,
      unselectedItemColor: AppColors.blackColor,
      items: _buildBarItems(context),
      currentIndex: _getIndex(context),
      onTap: (index) => _handleTap(index, context),
    );
  }

  List<BottomNavigationBarItem> _buildBarItems(BuildContext context) {
    return [
      _buildBarItem(
        label: 'Лента',
        iconName: AppIcons.newsIcon,
      ),
      _buildBarItem(
        label: 'Карта',
        iconName: AppIcons.mapIcon,
      ),
      _buildBarItem(
        label: 'Избранные',
        iconName: AppIcons.favoritesIcon,
      ),
      _buildBarItem(
        label: 'Профиль',
        iconName: AppIcons.profileIcon,
      ),
    ];
  }

  BottomNavigationBarItem _buildBarItem({
    required String label,
    required String iconName,
  }) =>
      BottomNavigationBarItem(
        activeIcon: Container(
          padding: EdgeInsets.only(bottom: 6),
          height: 24.0,
          child: SvgPicture.asset(
            iconName,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        icon: Container(
          height: 24.0,
          padding: EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(iconName),
        ),
        label: label,
      );

  int _getIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.toString();
    final key = _paths.keys.firstWhere(path.startsWith);

    return _paths[key] ?? 0;
  }

  void _handleTap(int index, BuildContext context) {
    final path = _paths.keys.toList()[index];

    context.go(path);
  }
}

final _paths = {
  AppRoutes.news.path: 0,
  AppRoutes.map.path: 1,
  AppRoutes.favorites.path: 2,
  AppRoutes.profile.path: 3,
};
