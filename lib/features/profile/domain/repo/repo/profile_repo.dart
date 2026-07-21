import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';

abstract class ProfileRepo {
  Future<ApiResult<ChannelInformationResponseEntity>> getChannelInformation();
}
