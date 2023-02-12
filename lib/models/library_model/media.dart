import 'dart:convert';

import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final int? id;
  final String? type;
  final String? mime;
  final String? key;
  final String? fileName;
  final String? etag;
  final String? url;
  final String? thumbnailUrl;
  final int? sizeKb;
  final int? durationSeconds;
  final bool? isPublished;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? createdById;

  const Media({
    this.id,
    this.type,
    this.mime,
    this.key,
    this.fileName,
    this.etag,
    this.url,
    this.thumbnailUrl,
    this.sizeKb,
    this.durationSeconds,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.createdById,
  });

  factory Media.fromMap(Map<String, dynamic> data) => Media(
        id: data['id'] as int?,
        type: data['type'] as String?,
        mime: data['mime'] as String?,
        key: data['key'] as String?,
        fileName: data['fileName'] as String?,
        etag: data['etag'] as String?,
        url: data['url'] as String?,
        thumbnailUrl: data['thumbnailUrl'] as String?,
        sizeKb: data['sizeKB'] as int?,
        durationSeconds: data['durationSeconds'] as int?,
        isPublished: data['isPublished'] as bool?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        createdById: data['createdById'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'mime': mime,
        'key': key,
        'fileName': fileName,
        'etag': etag,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
        'sizeKB': sizeKb,
        'durationSeconds': durationSeconds,
        'isPublished': isPublished,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'createdById': createdById,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Media].
  factory Media.fromJson(String data) {
    return Media.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Media] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      type,
      mime,
      key,
      fileName,
      etag,
      url,
      thumbnailUrl,
      sizeKb,
      durationSeconds,
      isPublished,
      createdAt,
      updatedAt,
      createdById,
    ];
  }
}
