import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';
import 'package:alkrouz/features/profile/domain/use_case/channel_information_response_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ChannelInformationResponseUseCase channelInformationResponseUseCase;
  ProfileCubit({required this.channelInformationResponseUseCase})
    : super(SettingsInitial());

  Future<void> getChannelInformation() async {
    emit(GettingChannelInformation());
    final result = await channelInformationResponseUseCase.call();
    switch (result) {
      case ApiSuccess<ChannelInformationResponseEntity>():
        emit(GettingChannelInformationSuccess(result.data!));
        break;
      case ApiError<ChannelInformationResponseEntity>():
        emit(GettingChannelInformationError(result.message));
        break;
    }
  }
}
