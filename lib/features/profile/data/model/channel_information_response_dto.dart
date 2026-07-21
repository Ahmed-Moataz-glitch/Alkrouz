// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alkrouz/features/profile/domain/entities/channel_information_response_entity.dart';

class ChannelInformationResponseDto {
  List<Items>? items;

  ChannelInformationResponseDto({this.items});

  ChannelInformationResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  ChannelInformationResponseEntity toEntity() {
    return ChannelInformationResponseEntity(
      items: items?.map((item) => item.toEntity()).toList() ?? [],
    );
  }
}

class Items {
  String? id;
  Snippet? snippet;
  Statistics? statistics;
  BrandingSettings? brandingSettings;

  Items({this.id, this.snippet, this.statistics, this.brandingSettings});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    snippet = json['snippet'] != null
        ? Snippet.fromJson(json['snippet'])
        : null;
    statistics = json['statistics'] != null
        ? Statistics.fromJson(json['statistics'])
        : null;
    brandingSettings = json['brandingSettings'] != null
        ? BrandingSettings.fromJson(json['brandingSettings'])
        : null;
  }

  ItemsChannelInformationEntity toEntity() {
    return ItemsChannelInformationEntity(
      id: id ?? '',
      snippet: snippet?.toEntity() ?? SnippetChannelInformationEntity(),
      statistics:
          statistics?.toEntity() ?? StatisticsChannelInformationEntity(),
      brandingSettings:
          brandingSettings?.toEntity() ??
          BrandingSettingsChannelInformationEntity(),
    );
  }
}

class Snippet {
  String? title;
  String? description;
  String? customUrl;
  String? publishedAt;
  Thumbnails? thumbnails;
  String? country;

  Snippet({
    this.title,
    this.description,
    this.customUrl,
    this.publishedAt,
    this.thumbnails,
    this.country,
  });

  Snippet.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    customUrl = json['customUrl'];
    publishedAt = json['publishedAt'];
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
    country = json['country'];
  }

  SnippetChannelInformationEntity toEntity() {
    return SnippetChannelInformationEntity(
      title: title ?? '',
      description: description ?? '',
      customUrl: customUrl ?? '',
      publishedAt: publishedAt ?? '',
      thumbnails:
          thumbnails?.toEntity() ?? ThumbnailsChannelInformationEntity(),
      country: country ?? '',
    );
  }
}

class Thumbnails {
  Default? defaultThumbnail;
  Default? medium;
  Default? high;

  Thumbnails({this.defaultThumbnail, this.medium, this.high});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    defaultThumbnail = json['default'] != null
        ? Default.fromJson(json['default'])
        : null;
    medium = json['medium'] != null ? Default.fromJson(json['medium']) : null;
    high = json['high'] != null ? Default.fromJson(json['high']) : null;
  }

  ThumbnailsChannelInformationEntity toEntity() {
    return ThumbnailsChannelInformationEntity(
      defaultThumbnail:
          defaultThumbnail?.toEntity() ?? DefaultChannelInformationEntity(),
      medium: medium?.toEntity() ?? DefaultChannelInformationEntity(),
      high: high?.toEntity() ?? DefaultChannelInformationEntity(),
    );
  }
}

class Default {
  String? url;
  int? width;
  int? height;

  Default({this.url, this.width, this.height});

  Default.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  DefaultChannelInformationEntity toEntity() {
    return DefaultChannelInformationEntity(
      url: url ?? '',
      width: width ?? 0,
      height: height ?? 0,
    );
  }
}

class Statistics {
  String? viewCount;
  String? subscriberCount;
  bool? hiddenSubscriberCount;
  String? videoCount;

  Statistics({
    this.viewCount,
    this.subscriberCount,
    this.hiddenSubscriberCount,
    this.videoCount,
  });

  Statistics.fromJson(Map<String, dynamic> json) {
    viewCount = json['viewCount'];
    subscriberCount = json['subscriberCount'];
    hiddenSubscriberCount = json['hiddenSubscriberCount'];
    videoCount = json['videoCount'];
  }

  StatisticsChannelInformationEntity toEntity() {
    return StatisticsChannelInformationEntity(
      viewCount: viewCount ?? '',
      subscriberCount: subscriberCount ?? '',
      hiddenSubscriberCount: hiddenSubscriberCount ?? false,
      videoCount: videoCount ?? '',
    );
  }
}

class BrandingSettings {
  Channel? channel;
  Image? image;

  BrandingSettings({this.channel, this.image});

  BrandingSettings.fromJson(Map<String, dynamic> json) {
    channel = json['channel'] != null
        ? Channel.fromJson(json['channel'])
        : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  BrandingSettingsChannelInformationEntity toEntity() {
    return BrandingSettingsChannelInformationEntity(
      channel: channel?.toEntity() ?? ChannelChannelInformationEntity(),
      image: image?.toEntity() ?? ImageChannelInformationEntity(),
    );
  }
}

class Channel {
  String? title;
  String? description;
  String? keywords;
  String? unsubscribedTrailer;
  String? country;

  Channel({
    this.title,
    this.description,
    this.keywords,
    this.unsubscribedTrailer,
    this.country,
  });

  Channel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    unsubscribedTrailer = json['unsubscribedTrailer'];
    country = json['country'];
  }

  ChannelChannelInformationEntity toEntity() {
    return ChannelChannelInformationEntity(
      title: title ?? '',
      description: description ?? '',
      keywords: keywords ?? '',
      unsubscribedTrailer: unsubscribedTrailer ?? '',
      country: country ?? '',
    );
  }
}

class Image {
  String? bannerExternalUrl;

  Image({this.bannerExternalUrl});

  Image.fromJson(Map<String, dynamic> json) {
    bannerExternalUrl = json['bannerExternalUrl'];
  }

  ImageChannelInformationEntity toEntity() {
    return ImageChannelInformationEntity(
      bannerExternalUrl: bannerExternalUrl ?? '',
    );
  }
}
