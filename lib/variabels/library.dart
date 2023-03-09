class Library {
  int? id;
  String? name;
  int? tagId;
  String? createdAt;
  String? updatedAt;
  int? mediaId;
  Media? media;
  List<Translations>? translations;

  Library(String s,
      {this.id,
      this.name,
      this.tagId,
      this.createdAt,
      this.updatedAt,
      this.mediaId,
      this.media,
      this.translations});

  Library.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagId = json['tagId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mediaId = json['mediaId'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagId'] = tagId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['mediaId'] = mediaId;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? type;
  String? mime;
  String? key;
  String? fileName;
  String? etag;
  String? url;
  String? thumbnailUrl;
  int? sizeKB;
  int? durationSeconds;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  int? createdById;

  Media(
      {this.id,
      this.type,
      this.mime,
      this.key,
      this.fileName,
      this.etag,
      this.url,
      this.thumbnailUrl,
      this.sizeKB,
      this.durationSeconds,
      this.isPublished,
      this.createdAt,
      this.updatedAt,
      this.createdById});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    mime = json['mime'];
    key = json['key'];
    fileName = json['fileName'];
    etag = json['etag'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
    sizeKB = json['sizeKB'];
    durationSeconds = json['durationSeconds'];
    isPublished = json['isPublished'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdById = json['createdById'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['mime'] = mime;
    data['key'] = key;
    data['fileName'] = fileName;
    data['etag'] = etag;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    data['sizeKB'] = sizeKB;
    data['durationSeconds'] = durationSeconds;
    data['isPublished'] = isPublished;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['createdById'] = createdById;
    return data;
  }
}

class Translations {
  int? id;
  int? libraryMediaId;
  String? language;
  String? name;
  int? mediaId;
  String? createdAt;
  String? updatedAt;
  Media? media;

  Translations(
      {this.id,
      this.libraryMediaId,
      this.language,
      this.name,
      this.mediaId,
      this.createdAt,
      this.updatedAt,
      this.media});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libraryMediaId = json['libraryMediaId'];
    language = json['language'];
    name = json['name'];
    mediaId = json['mediaId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['libraryMediaId'] = libraryMediaId;
    data['language'] = language;
    data['name'] = name;
    data['mediaId'] = mediaId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}
