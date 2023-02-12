import 'dart:convert';

import 'package:equatable/equatable.dart';

class Translation extends Equatable {
  final int? id;
  final int? tagId;
  final String? language;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Translation({
    this.id,
    this.tagId,
    this.language,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromMap(Map<String, dynamic> data) => Translation(
        id: data['id'] as int?,
        tagId: data['tagId'] as int?,
        language: data['language'] as String?,
        name: data['name'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'tagId': tagId,
        'language': language,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
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
      tagId,
      language,
      name,
      createdAt,
      updatedAt,
    ];
  }
}
