import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';

abstract class ProfileDataSource {
  Future<ApiResult<ChannelInformationResponseEntity>> getChannelInformation();
}
