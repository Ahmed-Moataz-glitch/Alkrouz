class KrouzVideosResponseEntity {
	List<ItemsKrouzVideosEntity> items;

	KrouzVideosResponseEntity({this.items = const []});
}

class ItemsKrouzVideosEntity {
	String id;
	SnippetKrouzVideosEntity snippet;
	StatisticsKrouzVideosEntity statistics;

	ItemsKrouzVideosEntity({this.id = '', this.snippet = const SnippetKrouzVideosEntity(), this.statistics = const StatisticsKrouzVideosEntity()});
}

class SnippetKrouzVideosEntity {
	final String publishedAt;
	final String channelId;
	final String title;
	final String description;
	final ThumbnailsKrouzVideosEntity thumbnails;
	final String channelTitle;
	final List<String> tags;
	final String categoryId;
	final String liveBroadcastContent;
	final String defaultLanguage;
	final String defaultAudioLanguage;

	const SnippetKrouzVideosEntity({this.publishedAt = '', this.channelId = '', this.title = '', this.description = '', this.thumbnails = const ThumbnailsKrouzVideosEntity(), this.channelTitle = '', this.tags = const [], this.categoryId = '', this.liveBroadcastContent = '', this.defaultLanguage = '', this.defaultAudioLanguage = ''});
}

class ThumbnailsKrouzVideosEntity {
	final DefaultKrouzVideosEntity defaultThumbnail;
	final DefaultKrouzVideosEntity medium;
	final DefaultKrouzVideosEntity high;
	final DefaultKrouzVideosEntity standard;
	final DefaultKrouzVideosEntity maxres;
	const ThumbnailsKrouzVideosEntity({this.defaultThumbnail = const DefaultKrouzVideosEntity(), this.medium = const DefaultKrouzVideosEntity(), this.high = const DefaultKrouzVideosEntity(), this.standard = const DefaultKrouzVideosEntity(), this.maxres = const DefaultKrouzVideosEntity()});
}

class DefaultKrouzVideosEntity {
	final String url;
	final int width;
	final int height;

	const DefaultKrouzVideosEntity({this.url = '', this.width = 0, this.height = 0});
}

class StatisticsKrouzVideosEntity {
	final String viewCount;
	final String likeCount;
	final String favoriteCount;
	final String commentCount;

	const StatisticsKrouzVideosEntity({this.viewCount = '', this.likeCount = '', this.favoriteCount = '', this.commentCount = ''});
}
