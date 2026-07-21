import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';
import 'package:alkrouz/features/profile/domain/repo/repo/profile_repo.dart';

class ChannelInformationResponseUseCase {
  final ProfileRepo _settingsRepo;
  ChannelInformationResponseUseCase(this._settingsRepo);

  Future<ApiResult<ChannelInformationResponseEntity>> call() {
    return _settingsRepo.getChannelInformation();
  }
}
