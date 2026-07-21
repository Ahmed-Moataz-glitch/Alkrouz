import 'package:alkrouz/core/utils/app_api.dart';
import 'package:alkrouz/core/utils/app_colors.dart';
import 'package:alkrouz/core/utils/app_toast.dart';
import 'package:alkrouz/core/utils/get_it.dart';
import 'package:alkrouz/core/view/widgets/format_numbers.dart';
import 'package:alkrouz/features/profile/representation/view_model/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toastification/toastification.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = getIt<ProfileCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await profileCubit.getChannelInformation();
    });
  }

  @override
  void dispose() {
    profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          bloc: profileCubit,
          listenWhen: (previous, current) =>
              current is GettingChannelInformationError,
          buildWhen: (previous, current) =>
              current is GettingChannelInformation ||
              current is GettingChannelInformationSuccess,
          listener: (context, state) {
            if (state is GettingChannelInformationError) {
              AppToast.showToast(
                context: context,
                title: 'Error',
                description: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is GettingChannelInformation) {
              Shimmer.fromColors(
                baseColor: AppColors.grey.withAlpha(300),
                highlightColor: AppColors.grey.withAlpha(300),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(12.r),
                        color: AppColors.white,
                      ),
                      width: size.width,
                      height: size.height * 0.15,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(16.r),
                            color: AppColors.white,
                          ),
                          width: size.width * 0.27,
                          height: size.height * 0.13,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          spacing: 4.h,
                          children: [
                            Text('Ahmed Glitch'),
                            Text('Ahmed Glitch'),
                            Text('Ahmed Glitch'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text('Ahmed Glitch'),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      spacing: 8.w,
                      children: [Icon(Icons.language), Text('Ahmed Glitch')],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      spacing: 8.w,
                      children: [Icon(Icons.language), Text('Ahmed Glitch')],
                    ),
                  ],
                ),
              );
            }
            if (state is GettingChannelInformationSuccess) {
              final channelInfo = state.channelInformationResponseEntity;
              AppApi.channelThumbnailUrl = channelInfo.items.first.snippet.thumbnails.high.url;
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12.r),
                      child: CachedNetworkImage(
                        width: size.width,
                        height: size.height * 0.15,
                        fit: BoxFit.cover,
                        imageUrl: channelInfo
                            .items
                            .first
                            .brandingSettings
                            .image
                            .bannerExternalUrl,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: AppColors.grey.withAlpha(300),
                          highlightColor: AppColors.grey.withAlpha(300),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16.r),
                          child: CachedNetworkImage(
                            width: size.width * 0.27,
                            height: size.height * 0.13,
                            fit: BoxFit.fill,
                            imageUrl: channelInfo
                                .items
                                .first
                                .snippet
                                .thumbnails
                                .high
                                .url,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: AppColors.grey.withAlpha(300),
                              highlightColor: AppColors.grey.withAlpha(300),
                              child: Container(
                                width: size.width * 0.27,
                                height: size.height * 0.13,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            spacing: 4.h,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                channelInfo.items.first.snippet.title,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                '${formatNumber(channelInfo.items.first.statistics.subscriberCount)} مشترك . ${formatNumber(channelInfo.items.first.statistics.videoCount)} فيديو',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black.withAlpha(150),
                                ),
                              ),
                              Text(
                                '${formatNumberWithCommas(channelInfo.items.first.statistics.viewCount)} مشاهدة',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black.withAlpha(150),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      channelInfo.items.first.snippet.description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      spacing: 8.w,
                      children: [
                        Icon(Icons.language, color: AppColors.primary),
                        Text(
                          channelInfo
                                      .items
                                      .first
                                      .brandingSettings
                                      .channel
                                      .country ==
                                  'EG'
                              ? 'مصر'
                              : channelInfo
                                    .items
                                    .first
                                    .brandingSettings
                                    .channel
                                    .country,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black.withAlpha(150),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      spacing: 8.w,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: AppColors.primary,
                        ),
                        Text(
                          'تاريخ الانضمام: ${formatDate(channelInfo.items.first.snippet.publishedAt)}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black.withAlpha(150),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
