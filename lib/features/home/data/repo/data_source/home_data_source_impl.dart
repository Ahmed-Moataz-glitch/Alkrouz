import 'package:alkrouz/features/home/data/api/api_result.dart';
import 'package:alkrouz/features/home/data/api/home_api.dart';
import 'package:alkrouz/features/home/data/model/krouz_videos_response_dto.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';
import 'package:alkrouz/features/home/domain/repo/data_source/home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final HomeApi _homeApi;
  HomeDataSourceImpl(this._homeApi);

  @override
  Future<ApiResult<KrouzVideosResponseEntity>> getKrouz1Videos() async {
    final result = await _homeApi.getKrouz1Videos();
    switch (result) {
      case ApiSuccess<KrouzVideosResponseDto>():
        return ApiSuccess<KrouzVideosResponseEntity>(
          result.data?.toEntity(),
        );
      case ApiError<KrouzVideosResponseDto>():
        return ApiError<KrouzVideosResponseEntity>(
          result.message,
        );
    }
  }

  @override
  Future<ApiResult<KrouzVideosResponseEntity>> getKrouz2Videos() async {
    final result = await _homeApi.getKrouz2Videos();
    switch (result) {
      case ApiSuccess<KrouzVideosResponseDto>():
        return ApiSuccess<KrouzVideosResponseEntity>(
          result.data?.toEntity(),
        );
      case ApiError<KrouzVideosResponseDto>():
        return ApiError<KrouzVideosResponseEntity>(
          result.message,
        );
    }
  }
}
