import 'package:alkrouz/features/home/data/api/api_result.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';
import 'package:alkrouz/features/home/domain/repo/repo/home_repo.dart';

class Krouz1VideosResponseUseCase {
  final HomeRepo _homeRepo;
  Krouz1VideosResponseUseCase(this._homeRepo);

  Future<ApiResult<KrouzVideosResponseEntity>> call() {
    return _homeRepo.getKrouz1Videos();
  }
}