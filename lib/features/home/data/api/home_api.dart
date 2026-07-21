import 'dart:convert';

import 'package:alkrouz/core/utils/app_api.dart';
import 'package:alkrouz/features/home/data/api/api_result.dart';
import 'package:alkrouz/features/home/data/model/krouz_videos_response_dto.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  Future<ApiResult<KrouzVideosResponseDto>> getKrouz1Videos() async {
    final url = Uri.https(AppApi.baseUrl, AppApi.videosEndpoint, {
      'key': AppApi.apiKey,
      'part': 'snippet,statistics',
      'id': AppApi.krouz1VideosId.join(','),
    });
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        return ApiError<KrouzVideosResponseDto>(
          response.reasonPhrase ?? 'Unknown error',
        );
      }
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<KrouzVideosResponseDto>(
        KrouzVideosResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<KrouzVideosResponseDto>(e.toString());
    }
  }

  Future<ApiResult<KrouzVideosResponseDto>> getKrouz2Videos() async {
    final url = Uri.https(AppApi.baseUrl, AppApi.videosEndpoint, {
      'key': AppApi.apiKey,
      'part': 'snippet,statistics',
      'id': AppApi.krouz2VideosId.join(','),
    });
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        return ApiError<KrouzVideosResponseDto>(
          response.reasonPhrase ?? 'Unknown error',
        );
      }
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<KrouzVideosResponseDto>(
        KrouzVideosResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<KrouzVideosResponseDto>(e.toString());
    }
  }
}
