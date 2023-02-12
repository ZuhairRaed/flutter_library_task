import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'media.dart';

class Translation extends Equatable {
  final int? id;
  final int? libraryMediaId;
  final String? language;
  final String? name;
  final int? mediaId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Media? media;

  const Translation({
    this.id,
    this.libraryMediaId,
    this.language,
    this.name,
    this.mediaId,
    this.createdAt,
    this.updatedAt,
    this.media,
  });

  factory Translation.fromMap(Map<String, dynamic> data) => Translation(
        id: data['id'] as int?,
        libraryMediaId: data['libraryMediaId'] as int?,
        language: data['language'] as String?,
        name: data['name'] as String?,
        mediaId: data['mediaId'] as int?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        media: data['media'] == null
            ? null
            : Media.fromMap(data['media'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'libraryMediaId': libraryMediaId,
        'language': language,
        'name': name,
        'mediaId': mediaId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'media': media?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Translation].
  factory Translation.fromJson(String data) {
    return Translation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Translation] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      libraryMediaId,
      language,
      name,
      mediaId,
      createdAt,
      updatedAt,
      media,
    ];
  }
}
