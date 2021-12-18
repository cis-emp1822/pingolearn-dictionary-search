class DictionaryModel {
  String? word;
  String? pronunciation;
  List<Definitions>? definitions;

  DictionaryModel({this.word, this.pronunciation, this.definitions});

  DictionaryModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    pronunciation = json['pronunciation'];
    if (json['definitions'] != null) {
      definitions = [];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['word'] = word;
    data['pronunciation'] = pronunciation;
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String? type;
  String? definition;
  String? example;
  String? imageUrl;
  String? emoji;

  Definitions(
      {this.type, this.definition, this.example, this.imageUrl, this.emoji});

  Definitions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    definition = json['definition'];
    example = json['example'];
    imageUrl = json['image_url'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['definition'] = definition;
    data['example'] = example;
    data['image_url'] = imageUrl;
    data['emoji'] = emoji;
    return data;
  }
}
