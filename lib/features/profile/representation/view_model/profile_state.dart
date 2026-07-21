part of 'profile_cubit.dart';

sealed class ProfileState {}

final class SettingsInitial extends ProfileState {}

final class GettingChannelInformation extends ProfileState {}

final class GettingChannelInformationSuccess extends ProfileState {
  final ChannelInformationResponseEntity channelInformationResponseEntity;
  GettingChannelInformationSuccess(this.channelInformationResponseEntity);
}

final class GettingChannelInformationError extends ProfileState {
  final String message;
  GettingChannelInformationError(this.message);
}
