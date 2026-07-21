import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:alkrouz/features/profile/data/api/profile_api.dart';
import 'package:alkrouz/features/profile/data/model/channel_information_response_dto.dart';
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';
import 'package:alkrouz/features/profile/domain/repo/data_source/profile_data_source.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  final ProfileApi _settingsApi;
  ProfileDataSourceImpl(this._settingsApi);

  @override
  Future<ApiResult<ChannelInformationResponseEntity>>
  getChannelInformation() async {
    final result = await _settingsApi.getChannelInformation();
    switch (result) {
      case ApiSuccess<ChannelInformationResponseDto>():
        return ApiSuccess<ChannelInformationResponseEntity>(
          result.data?.toEntity(),
        );
      case ApiError<ChannelInformationResponseDto>():
        return ApiError<ChannelInformationResponseEntity>(result.message);
    }
  }
}
