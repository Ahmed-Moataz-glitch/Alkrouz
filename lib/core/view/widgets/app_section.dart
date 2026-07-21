import 'package:alkrouz/core/utils/app_colors.dart';import 'package:alkrouz/features/home/representation/view/pages/home_page.dart';
import 'package:alkrouz/features/profile/representation/view/pages/profile_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class TabItem {
  final IconData icon;
  final String label;

  TabItem({required this.label, required this.icon});
}

class _AppSectionState extends State<AppSection> {
  late final PageController pageController;
  int activeIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: activeIndex);
    pages = [const HomePage(), const ProfilePage()];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<TabItem> tabs = [
      TabItem(label: 'الرئيسية', icon: Icons.home),
      TabItem(label: 'الملف الشخصي', icon: Icons.settings),
    ];
    return Scaffold(
      body: pages[activeIndex],
      // body: PageView.builder(
      //   controller: pageController,
      //   itemCount: pages.length,
      //   onPageChanged: (index) => setState(() => activeIndex = index),
      //   physics:
      //       const NeverScrollableScrollPhysics(), // Disable swipe navigation
      //   itemBuilder: (context, index) => pages[index],
      // ),
      bottomNavigationBar: //Container(
          // decoration: BoxDecoration(
          //   border: Border(
          //     top: isLightMode
          //     ? BorderSide.none
          //     : BorderSide(
          //       color:AppColors.primary.withAlpha(200),
          //       width: 0.8.r,
          //     ),
          //   ),
          // ),
          AnimatedBottomNavigationBar.builder(
            itemCount: tabs.length,
            activeIndex: activeIndex,
            onTap: (index) {
              activeIndex = index;
              setState(() {});
            },
            gapLocation: GapLocation.none,
            elevation: 10,
            backgroundColor: AppColors.primary,
            tabBuilder: (index, isActive) {
              final color = isActive
                  ? AppColors.white
                  : AppColors.white.withAlpha(120);
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(tabs[index].icon, color: color, size: 24.sp),
                    SizedBox(height: 4.h),
                    Text(
                      tabs[index].label,
                      style: TextStyle(
                        color: color,
                        fontSize: 14.sp,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }
}
