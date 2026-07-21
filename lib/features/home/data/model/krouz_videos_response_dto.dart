import 'package:alkrouz/features/home/domain/entities/krouz_videos_response_entity.dart';

class KrouzVideosResponseDto {
  List<Items>? items;

  KrouzVideosResponseDto({this.items});

  KrouzVideosResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  KrouzVideosResponseEntity toEntity() {
    return KrouzVideosResponseEntity(
      items: items?.map((item) => item.toEntity()).toList() ?? [],
    );
  }
}

class Items {
  String? id;
  Snippet? snippet;
  Statistics? statistics;

  Items({this.id, this.snippet, this.statistics});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    snippet = json['snippet'] != null
        ? Snippet.fromJson(json['snippet'])
        : null;
    statistics = json['statistics'] != null
        ? Statistics.fromJson(json['statistics'])
        : null;
  }

  ItemsKrouzVideosEntity toEntity() {
    return ItemsKrouzVideosEntity(
      id: id ?? '',
      snippet:
          snippet?.toEntity() ??
          SnippetKrouzVideosEntity(
            publishedAt: '',
            channelId: '',
            title: '',
            description: '',
            thumbnails: ThumbnailsKrouzVideosEntity(
              defaultThumbnail: DefaultKrouzVideosEntity(
                url: '',
                width: 0,
                height: 0,
              ),
              medium: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
              high: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
              standard: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
              maxres: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
            ),
            channelTitle: '',
            tags: [],
            categoryId: '',
            liveBroadcastContent: '',
            defaultLanguage: '',
            defaultAudioLanguage: '',
          ),
      statistics:
          statistics?.toEntity() ??
          StatisticsKrouzVideosEntity(
            viewCount: '',
            likeCount: '',
            favoriteCount: '',
            commentCount: '',
          ),
    );
  }
}

class Snippet {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  List<String>? tags;
  String? categoryId;
  String? liveBroadcastContent;
  String? defaultLanguage;
  String? defaultAudioLanguage;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.defaultLanguage,
    this.defaultAudioLanguage,
  });

  Snippet.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    channelId = json['channelId'];
    title = json['title'];
    description = json['description'];
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
    channelTitle = json['channelTitle'];
    tags = json['tags'].cast<String>();
    categoryId = json['categoryId'];
    liveBroadcastContent = json['liveBroadcastContent'];
    defaultLanguage = json['defaultLanguage'];
    defaultAudioLanguage = json['defaultAudioLanguage'];
  }

  SnippetKrouzVideosEntity toEntity() {
    return SnippetKrouzVideosEntity(
      publishedAt: publishedAt ?? '',
      channelId: channelId ?? '',
      title: title ?? '',
      description: description ?? '',
      thumbnails:
          thumbnails?.toEntity() ??
          ThumbnailsKrouzVideosEntity(
            defaultThumbnail: DefaultKrouzVideosEntity(
              url: '',
              width: 0,
              height: 0,
            ),
            medium: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
            high: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
            standard: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
            maxres: DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
          ),
      channelTitle: channelTitle ?? '',
      tags: tags ?? [],
      categoryId: categoryId ?? '',
      liveBroadcastContent: liveBroadcastContent ?? '',
      defaultLanguage: defaultLanguage ?? '',
      defaultAudioLanguage: defaultAudioLanguage ?? '',
    );
  }
}

class Thumbnails {
  Default? defaultThumbnail;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  Thumbnails({
    this.defaultThumbnail,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Thumbnails.fromJson(Map<String, dynamic> json) {
    defaultThumbnail = json['default'] != null
        ? Default.fromJson(json['default'])
        : null;
    medium = json['medium'] != null ? Default.fromJson(json['medium']) : null;
    high = json['high'] != null ? Default.fromJson(json['high']) : null;
    standard = json['standard'] != null
        ? Default.fromJson(json['standard'])
        : null;
    maxres = json['maxres'] != null ? Default.fromJson(json['maxres']) : null;
  }

  ThumbnailsKrouzVideosEntity toEntity() {
    return ThumbnailsKrouzVideosEntity(
      defaultThumbnail:
          defaultThumbnail?.toEntity() ??
          DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
      medium:
          medium?.toEntity() ??
          DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
      high:
          high?.toEntity() ??
          DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
      standard:
          standard?.toEntity() ??
          DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
      maxres:
          maxres?.toEntity() ??
          DefaultKrouzVideosEntity(url: '', width: 0, height: 0),
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

  DefaultKrouzVideosEntity toEntity() {
    return DefaultKrouzVideosEntity(
      url: url ?? '',
      width: width ?? 0,
      height: height ?? 0,
    );
  }
}

class Statistics {
  String? viewCount;
  String? likeCount;
  String? favoriteCount;
  String? commentCount;

  Statistics({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
  });

  Statistics.fromJson(Map<String, dynamic> json) {
    viewCount = json['viewCount'];
    likeCount = json['likeCount'];
    favoriteCount = json['favoriteCount'];
    commentCount = json['commentCount'];
  }
  StatisticsKrouzVideosEntity toEntity() {
    return StatisticsKrouzVideosEntity(
      viewCount: viewCount ?? '',
      likeCount: likeCount ?? '',
      favoriteCount: favoriteCount ?? '',
      commentCount: commentCount ?? '',
    );
  }
}
