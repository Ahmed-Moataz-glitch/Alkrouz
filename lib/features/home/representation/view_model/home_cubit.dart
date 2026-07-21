import 'package:alkrouz/features/home/data/api/api_result.dart';
import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';
import 'package:alkrouz/features/home/domain/use_case/krouz1_videos_response_use_case.dart';
import 'package:alkrouz/features/home/domain/use_case/krouz2_videos_response_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Krouz1VideosResponseUseCase krouz1VideosResponseUseCase;
  final Krouz2VideosResponseUseCase krouz2VideosResponseUseCase;
  HomeCubit({
    required this.krouz1VideosResponseUseCase,
    required this.krouz2VideosResponseUseCase,
  }) : super(HomeInitial());

  Future<void> getKrouz1Videos() async {
    emit(GettingKrouz1Videos());
    final result = await krouz1VideosResponseUseCase.call();
    switch (result) {
      case ApiSuccess<KrouzVideosResponseEntity>():
        emit(GettingKrouz1VideosSuccess(result.data!));
        break;
      case ApiError<KrouzVideosResponseEntity>():
        emit(GettingKrouz1VideosError(result.message));
        break;
    }
  }

  Future<void> getKrouz2Videos() async {
    emit(GettingKrouz2Videos());
    final result = await krouz2VideosResponseUseCase.call();
    switch (result) {
      case ApiSuccess<KrouzVideosResponseEntity>():
        emit(GettingKrouz2VideosSuccess(result.data!));
        break;
      case ApiError<KrouzVideosResponseEntity>():
        emit(GettingKrouz2VideosError(result.message));
        break;
    }
  }
}