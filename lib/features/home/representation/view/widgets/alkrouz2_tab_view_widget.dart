import 'package:alkrouz/core/utils/app_api.dart';
import 'package:alkrouz/core/utils/app_colors.dart';
import 'package:alkrouz/core/utils/app_routes.dart';
import 'package:alkrouz/core/utils/app_toast.dart';
import 'package:alkrouz/core/view/widgets/format_numbers.dart';
import 'package:alkrouz/features/home/representation/view_model/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toastification/toastification.dart';

class Alkrouz2TabViewWidget extends StatefulWidget {
  final HomeCubit homeCubit;
  const Alkrouz2TabViewWidget({super.key, required this.homeCubit});

  @override
  State<Alkrouz2TabViewWidget> createState() => _Alkrouz2TabViewWidgetState();
}

class _Alkrouz2TabViewWidgetState extends State<Alkrouz2TabViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.homeCubit.getKrouz2Videos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      listenWhen: (previous, current) => current is GettingKrouz2VideosError,
      buildWhen: (previous, current) =>
          current is GettingKrouz2Videos || 
          current is GettingKrouz2VideosSuccess,
      listener: (context, state) {
        if (state is GettingKrouz2VideosError) {
          AppToast.showToast(
            context: context,
            title: 'Error',
            description: state.message,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is GettingKrouz2Videos) {
          Shimmer.fromColors(
            baseColor: AppColors.grey.withAlpha(300),
            highlightColor: AppColors.grey.withAlpha(300),
            child: ListView.separated(
              itemCount: 7,
              separatorBuilder: (context, index) =>
                  SizedBox(height: size.height * 0.025),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: AppColors.grey.withAlpha(300),
                  highlightColor: AppColors.grey.withAlpha(300),
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.45,
                        height: size.height * 0.16,
                        color: AppColors.white,
                      ),
                      Column(
                        spacing: 12.h,
                        children: [
                          Text(
                            'Ahmed Glitch',
                          ),
                          Text(
                            'Ahmed Glitch',
                          ),
                          Text(
                            'Ahmed Glitch',
                          ),
                          Text(
                            'Ahmed Glitch',
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        if (state is GettingKrouz2VideosSuccess) {
          final krouz2Videos = state.krouzVideosResponseEntity.items;
          return ListView.separated(
            itemCount: krouz2Videos.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: size.height * 0.025),
            itemBuilder: (context, index) {
              return InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.details,
                    arguments: krouz2Videos[index],
                  );
                },
                child: Row(
                  spacing: 12.w,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        width: size.width * 0.45,
                        height: size.height * 0.16,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: AppColors.grey.withAlpha(300),
                          highlightColor: AppColors.grey.withAlpha(300),
                          child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.16,
                            color: AppColors.white,
                          ),
                        ),
                        imageUrl:
                            krouz2Videos[index].snippet.thumbnails.maxres.url,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12.h,
                        children: [
                          Text(
                            krouz2Videos[index].snippet.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            '${formatNumber(krouz2Videos[index].statistics.viewCount)} مشاهدة . ${formatPublishedDate(krouz2Videos[index].snippet.publishedAt)}',
                            style: TextStyle(
                              color: AppColors.black.withAlpha(150),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            spacing: 8.w,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  48.r,
                                ),
                                child: CachedNetworkImage(
                                  width: size.width * 0.08,
                                  height: size.height * 0.04,
                                  fit: BoxFit.fill,
                                  imageUrl: AppApi.channelThumbnailUrl,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: AppColors.grey.withAlpha(
                                          300,
                                        ),
                                        highlightColor: AppColors.grey
                                            .withAlpha(300),
                                        child: Container(
                                          width: size.width,
                                          height: size.height * 0.13,
                                          color: AppColors.white,
                                        ),
                                      ),
                                ),
                              ),
                              Text(
                                krouz2Videos[index].snippet.channelTitle,
                                style: TextStyle(
                                  color: AppColors.black.withAlpha(150),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // Text(
                          //   krouz2Videos[index].snippet.description,
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: TextStyle(
                          //     color: AppColors.black.withAlpha(150),
                          //     fontSize: 15.sp,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
