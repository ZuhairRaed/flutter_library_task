import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'media.dart';
import 'translation.dart';

class LibraryModel extends Equatable {
  final int? id;
  final String? name;
  final int? tagId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? mediaId;
  final Media? media;
  final List<Translation>? translations;

  const LibraryModel({
    this.id,
    this.name,
    this.tagId,
    this.createdAt,
    this.updatedAt,
    this.mediaId,
    this.media,
    this.translations,
  });

  factory LibraryModel.fromMap(Map<String, dynamic> data) => LibraryModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        tagId: data['tagId'] as int?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        mediaId: data['mediaId'] as int?,
        media: data['media'] == null
            ? null
            : Media.fromMap(data['media'] as Map<String, dynamic>),
        translations: (data['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'tagId': tagId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'mediaId': mediaId,
        'media': media?.toMap(),
        'translations': translations?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LibraryModel].
  factory LibraryModel.fromJson(String data) {
    return LibraryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LibraryModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      name,
      tagId,
      createdAt,
      updatedAt,
      mediaId,
      media,
      translations,
    ];
  }
}
