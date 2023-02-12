class Tags {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Translation>? translation;

  Tags({this.id, this.name, this.createdAt, this.updatedAt, this.translation});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['translation'] != null) {
      translation = <Translation>[];
      json['translation'].forEach((v) {
        translation!.add(new Translation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.translation != null) {
      data['translation'] = this.translation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translation {
  int? id;
  int? tagId;
  String? language;
  String? name;
  String? createdAt;
  String? updatedAt;

  Translation(
      {this.id,
      this.tagId,
      this.language,
      this.name,
      this.createdAt,
      this.updatedAt});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagId = json['tagId'];
    language = json['language'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tagId'] = this.tagId;
    data['language'] = this.language;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
