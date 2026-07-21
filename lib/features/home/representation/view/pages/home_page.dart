import 'package:alkrouz/core/utils/app_assets.dart';
import 'package:alkrouz/core/utils/app_colors.dart';
import 'package:alkrouz/core/utils/get_it.dart';
import 'package:alkrouz/features/home/representation/view/widgets/alkrouz1_tab_view_widget.dart';
import 'package:alkrouz/features/home/representation/view/widgets/alkrouz2_tab_view_widget.dart';
import 'package:alkrouz/features/home/representation/view_model/home_cubit.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeCubit homeCubit;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    homeCubit = getIt<HomeCubit>();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    homeCubit.close();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.alkrouzLogo,
          fit: BoxFit.fill,  
          width: 120.w,
          height: 120.h,
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12.w, vertical: 24.h),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                ButtonsTabBar(
                  controller: tabController,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  buttonMargin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  backgroundColor: AppColors.primary,
                  unselectedBackgroundColor: AppColors.grey.withAlpha(300),
                  unselectedLabelStyle: TextStyle(
                    color: AppColors.black.withAlpha(150),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  contentCenter: true,
                  tabs: [
                    Tab(text: 'الكروز الاول'),
                    Tab(text: 'الكروز الثاني'),
                  ],
                ),
                SizedBox(height: 36.h),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Alkrouz1TabViewWidget(homeCubit: homeCubit),
                      Alkrouz2TabViewWidget(homeCubit: homeCubit),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
