import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';
import 'package:alkrouz/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:alkrouz/features/profile/domain/repo/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource _settingsDataSource;
  ProfileRepoImpl(this._settingsDataSource);

  @override
  Future<ApiResult<ChannelInformationResponseEntity>>
  getChannelInformation() async {
    return await _settingsDataSource.getChannelInformation();
  }
}
