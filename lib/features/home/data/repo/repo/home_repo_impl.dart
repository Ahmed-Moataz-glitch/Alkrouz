import 'package:alkrouz/features/home/data/api/api_result.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';
import 'package:alkrouz/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:alkrouz/features/home/domain/repo/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource _homeDataSource;
  HomeRepoImpl(this._homeDataSource);

  @override
  Future<ApiResult<KrouzVideosResponseEntity>> getKrouz1Videos() async {
    return await _homeDataSource.getKrouz1Videos();
  }

  @override
  Future<ApiResult<KrouzVideosResponseEntity>> getKrouz2Videos() async {
    return await _homeDataSource.getKrouz2Videos();
  }
}