import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str) ?? {});

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    this.items = const [],
    this.nextPageToken = '',
  });

  String? nextPageToken;
  List<Item>? items;

  factory VideoModel.fromJson(Map<String, dynamic>? json) => VideoModel(
        nextPageToken: json?["nextPageToken"] ?? '',
        items: (json?["items"] as List?)?.map((x) => Item.fromJson(x)).toList() ?? [],
      );

  Map<String, dynamic> toJson() => {
        "nextPageToken": nextPageToken,
        "items": items?.map((x) => x.toJson()).toList(),
      };
}

class Item {
  Item({
    this.snippet,
  });

  Snippet? snippet;

  factory Item.fromJson(Map<String, dynamic>? json) => Item(
        snippet: json?["snippet"] != null ? Snippet.fromJson(json!["snippet"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "snippet": snippet?.toJson(),
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.title = '',
    this.description = '',
    this.thumbnails,
    this.resourceId,
  });

  DateTime? publishedAt;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  ResourceId? resourceId;

  factory Snippet.fromJson(Map<String, dynamic>? json) => Snippet(
        publishedAt: json?["publishedAt"] != null ? DateTime.tryParse(json!["publishedAt"]) : null,
        title: json?["title"] ?? 'No Title',
        description: json?["description"] ?? 'No Description',
        thumbnails: json?["thumbnails"] != null ? Thumbnails.fromJson(json!["thumbnails"]) : null,
        resourceId: json?["resourceId"] != null ? ResourceId.fromJson(json!["resourceId"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "resourceId": resourceId?.toJson(),
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic>? json) => Thumbnails(
        thumbnailsDefault: json?["default"] != null ? Default.fromJson(json!["default"]) : null,
        medium: json?["medium"] != null ? Default.fromJson(json!["medium"]) : null,
        high: json?["high"] != null ? Default.fromJson(json!["high"]) : null,
        standard: json?["standard"] != null ? Default.fromJson(json!["standard"]) : null,
        maxres: json?["maxres"] != null ? Default.fromJson(json!["maxres"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
        "standard": standard?.toJson(),
        "maxres": maxres?.toJson(),
      };
}

class Default {
  Default({
    this.url = '',
    this.width = 0,
    this.height = 0,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromJson(Map<String, dynamic>? json) => Default(
        url: json?["url"] ?? '',
        width: json?["width"] ?? 0,
        height: json?["height"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class ResourceId {
  ResourceId({
    this.videoId = '',
  });

  String? videoId;

  factory ResourceId.fromJson(Map<String, dynamic>? json) => ResourceId(
        videoId: json?["videoId"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
      };
}
