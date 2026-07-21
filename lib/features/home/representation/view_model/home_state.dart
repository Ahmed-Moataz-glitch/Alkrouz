part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GettingKrouz1Videos extends HomeState {}

final class GettingKrouz1VideosSuccess extends HomeState {
  final KrouzVideosResponseEntity krouzVideosResponseEntity;
  GettingKrouz1VideosSuccess(this.krouzVideosResponseEntity);
}

final class GettingKrouz1VideosError extends HomeState {
  final String message;
  GettingKrouz1VideosError(this.message);
}

final class GettingKrouz2Videos extends HomeState {}

final class GettingKrouz2VideosSuccess extends HomeState {
  final KrouzVideosResponseEntity krouzVideosResponseEntity;
  GettingKrouz2VideosSuccess(this.krouzVideosResponseEntity);
}

final class GettingKrouz2VideosError extends HomeState {
  final String message;
  GettingKrouz2VideosError(this.message);
}
