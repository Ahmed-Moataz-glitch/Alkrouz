import 'package:alkrouz/core/utils/app_constants.dart';
import 'package:alkrouz/core/utils/app_routes.dart';
import 'package:alkrouz/core/utils/get_it.dart';
import 'package:alkrouz/core/view/widgets/app_section.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';
import 'package:alkrouz/features/home/representation/view/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 869),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: AppConstants.appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          onGenerateInitialRoutes: (initialRoute) => [
            MaterialPageRoute(
              builder: (context) {
                return const AppSection();
              },
            ),
          ],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case AppRoutes.details:
                final video = settings.arguments as ItemsKrouzVideosEntity;
                return MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(video: video);
                  },
                );
            }
            return null;
          },
        );
      },
    );
  }
}
