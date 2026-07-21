import 'package:alkrouz/features/home/data/api/home_api.dart';
import 'package:alkrouz/features/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:alkrouz/features/home/data/repo/repo/home_repo_impl.dart';
import 'package:alkrouz/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:alkrouz/features/home/domain/repo/repo/home_repo.dart';
import 'package:alkrouz/features/home/domain/use_case/krouz1_videos_response_use_case.dart';
import 'package:alkrouz/features/home/domain/use_case/krouz2_videos_response_use_case.dart';
import 'package:alkrouz/features/home/representation/view_model/home_cubit.dart';
import 'package:alkrouz/features/profile/data/api/profile_api.dart';
import 'package:alkrouz/features/profile/data/repo/data_source/profile_data_source_impl.dart';
import 'package:alkrouz/features/profile/data/repo/repo/profile_repo_impl.dart';
import 'package:alkrouz/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:alkrouz/features/profile/domain/repo/repo/profile_repo.dart';
import 'package:alkrouz/features/profile/domain/use_case/channel_information_response_use_case.dart';
import 'package:alkrouz/features/profile/representation/view_model/profile_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<HomeApi>(HomeApi());
  getIt.registerSingleton<HomeDataSource>(HomeDataSourceImpl(getIt<HomeApi>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt<HomeDataSource>()));
  getIt.registerSingleton<Krouz1VideosResponseUseCase>(
    Krouz1VideosResponseUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<Krouz2VideosResponseUseCase>(
    Krouz2VideosResponseUseCase(getIt<HomeRepo>()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      krouz1VideosResponseUseCase: getIt<Krouz1VideosResponseUseCase>(),
      krouz2VideosResponseUseCase: getIt<Krouz2VideosResponseUseCase>(),
    ),
  );

  getIt.registerSingleton<ProfileApi>(ProfileApi());
  getIt.registerSingleton<ProfileDataSource>(
    ProfileDataSourceImpl(getIt<ProfileApi>()),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(getIt<ProfileDataSource>()),
  );
  getIt.registerSingleton<ChannelInformationResponseUseCase>(
    ChannelInformationResponseUseCase(getIt<ProfileRepo>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      channelInformationResponseUseCase:
          getIt<ChannelInformationResponseUseCase>(),
    ),
  );
}
