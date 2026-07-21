class ChannelInformationResponseEntity {
  List<ItemsChannelInformationEntity> items;

  ChannelInformationResponseEntity({this.items = const []});
}

class ItemsChannelInformationEntity {
  String id;
  SnippetChannelInformationEntity snippet;
  StatisticsChannelInformationEntity statistics;
  BrandingSettingsChannelInformationEntity brandingSettings;

  ItemsChannelInformationEntity({
    this.id = '',
    this.snippet = const SnippetChannelInformationEntity(),
    this.statistics = const StatisticsChannelInformationEntity(),
    this.brandingSettings = const BrandingSettingsChannelInformationEntity(),
  });
}

class SnippetChannelInformationEntity {
  final String title;
  final String description;
  final String customUrl;
  final String publishedAt;
  final ThumbnailsChannelInformationEntity thumbnails;
  final String country;

  const SnippetChannelInformationEntity({
    this.title = '',
    this.description = '',
    this.customUrl = '',
    this.publishedAt = '',
    this.thumbnails = const ThumbnailsChannelInformationEntity(),
    this.country = '',
  });
}

class ThumbnailsChannelInformationEntity {
  final DefaultChannelInformationEntity defaultThumbnail;
  final DefaultChannelInformationEntity medium;
  final DefaultChannelInformationEntity high;

  const ThumbnailsChannelInformationEntity({
    this.defaultThumbnail = const DefaultChannelInformationEntity(),
    this.medium = const DefaultChannelInformationEntity(),
    this.high = const DefaultChannelInformationEntity(),
  });
}

class DefaultChannelInformationEntity {
  final String url;
  final int width;
  final int height;

  const DefaultChannelInformationEntity({
    this.url = '',
    this.width = 0,
    this.height = 0,
  });
}

class StatisticsChannelInformationEntity {
  final String viewCount;
  final String subscriberCount;
  final bool hiddenSubscriberCount;
  final String videoCount;

  const StatisticsChannelInformationEntity({
    this.viewCount = '',
    this.subscriberCount = '',
    this.hiddenSubscriberCount = false,
    this.videoCount = '',
  });
}

class BrandingSettingsChannelInformationEntity {
  final ChannelChannelInformationEntity channel;
  final ImageChannelInformationEntity image;

  const BrandingSettingsChannelInformationEntity({
    this.channel = const ChannelChannelInformationEntity(),
    this.image = const ImageChannelInformationEntity(),
  });
}

class ChannelChannelInformationEntity {
  final String title;
  final String description;
  final String keywords;
  final String unsubscribedTrailer;
  final String country;
  const ChannelChannelInformationEntity({
    this.title = '',
    this.description = '',
    this.keywords = '',
    this.unsubscribedTrailer = '',
    this.country = '',
  });
}

class ImageChannelInformationEntity {
  final String bannerExternalUrl;

  const ImageChannelInformationEntity({this.bannerExternalUrl = ''});
}
