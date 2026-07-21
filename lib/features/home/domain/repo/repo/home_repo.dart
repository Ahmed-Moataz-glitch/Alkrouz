import 'package:alkrouz/features/home/data/api/api_result.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<KrouzVideosResponseEntity>> getKrouz1Videos();
  Future<ApiResult<KrouzVideosResponseEntity>> getKrouz2Videos();
}