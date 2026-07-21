import 'dart:convert';
import 'package:alkrouz/core/utils/app_api.dart';
import 'package:alkrouz/features/profile/data/api/api_result.dart';
import 'package:http/http.dart' as http;
import 'package:alkrouz/features/profile/data/model/channel_information_response_dto.dart';

class ProfileApi {
  Future<ApiResult<ChannelInformationResponseDto>>
  getChannelInformation() async {
    var url = Uri.https(AppApi.baseUrl, AppApi.channelsEndpoint, {
      'key': AppApi.apiKey,
      'part': 'snippet,statistics,brandingSettings',
      'forHandle': AppApi.username,
    });
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        return ApiError<ChannelInformationResponseDto>(
          response.reasonPhrase ?? 'Unknown error',
        );
      }
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<ChannelInformationResponseDto>(
        ChannelInformationResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<ChannelInformationResponseDto>(e.toString());
    }
  }
}
