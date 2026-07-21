import 'package:alkrouz/core/utils/app_colors.dart';
import 'package:alkrouz/core/view/widgets/format_numbers.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pod_player/pod_player.dart';

class DetailsPage extends StatefulWidget {
  final ItemsKrouzVideosEntity video;
  const DetailsPage({super.key, required this.video});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final PodPlayerController podPlayerController;

  @override
  void initState() {
    super.initState();
    podPlayerController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        'https://www.youtube.com/watch?v=${widget.video.id}',
      ),
    )..initialise();
  }

  @override
  void dispose() {
    podPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'تفاصيل الفيديو',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 24.sp, 
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            CachedNetworkImage(
              imageUrl: widget.video.snippet.thumbnails.maxres.url,
              width: size.width,
              height: size.height * 0.3,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.snippet.title,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${formatNumber(widget.video.statistics.viewCount)} مشاهدة . ${formatPublishedDate(widget.video.snippet.publishedAt)}',
                    style: TextStyle(
                      color: AppColors.black.withAlpha(150),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8.w,
                        children: [
                          Icon(
                            Icons.thumb_up_alt,
                            size: 28.sp,
                            color: AppColors.primary,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.h),
                            child: Text(
                              formatLikeCount(
                                widget.video.statistics.likeCount,
                              ),
                              style: TextStyle(
                                color: AppColors.black.withAlpha(150),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 36.w,
                        child: VerticalDivider(
                          color: AppColors.black.withAlpha(150),
                          thickness: 1.6.r,
                          width: 32.w,
                          indent: 4.h,
                          endIndent: 4.h,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8.w,
                        children: [
                          Icon(
                            Icons.chat,
                            size: 28.sp,
                            color: AppColors.primary,
                          ),
                          Text(
                            formatLikeCount(
                              widget.video.statistics.commentCount,
                            ),
                            style: TextStyle(
                              color: AppColors.black.withAlpha(150),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 36.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: PodVideoPlayer(
                        controller: podPlayerController,
                        videoThumbnail: DecorationImage(
                          image: NetworkImage(
                            widget.video.snippet.thumbnails.maxres.url,
                          ),
                          fit: BoxFit.fill,
                        ),
                        podProgressBarConfig: PodProgressBarConfig(
                          backgroundColor: AppColors.grey.withAlpha(300),
                          circleHandlerColor: AppColors.primary,
                          playingBarColor: AppColors.primary,
                          height: 4.h,
                        ),
                        matchFrameAspectRatioToVideo: true,
                        matchVideoAspectRatioToFrame: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
