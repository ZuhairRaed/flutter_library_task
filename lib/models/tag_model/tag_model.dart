import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'translation.dart';

class TagModel extends Equatable {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Translation>? translation;

  const TagModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.translation,
  });

  factory TagModel.fromMap(Map<String, dynamic> data) => TagModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        translation: (data['translation'] as List<dynamic>?)
            ?.map((e) => Translation.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'translation': translation?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TagModel].
  factory TagModel.fromJson(String data) {
    return TagModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TagModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      name,
      createdAt,
      updatedAt,
      translation,
    ];
  }
}
