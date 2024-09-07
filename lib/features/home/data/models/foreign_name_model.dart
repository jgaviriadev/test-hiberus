import 'dart:convert';

import '../../domain/entities/foreign_name_entity.dart';
import 'identifiers_model.dart';

class ForeignNameModel extends ForeignNameEntity {
  const ForeignNameModel({
    super.name,
    super.text,
    super.type,
    super.flavor,
    super.imageUrl,
    super.language,
    IdentifiersModel? super.identifiers,
    super.multiverseid,
  });

  factory ForeignNameModel.fromJson(String str) =>
      ForeignNameModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForeignNameModel.fromMap(Map<String, dynamic> json) => ForeignNameModel(
    name: json["name"],
    text: json["text"],
    type: json["type"],
    flavor: json["flavor"],
    imageUrl: json["imageUrl"],
    language: json["language"],
    identifiers: json["identifiers"] == null ? null : IdentifiersModel.fromMap(json["identifiers"]),
    multiverseid: json["multiverseid"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "name": name,
    "text": text,
    "type": type,
    "flavor": flavor,
    "imageUrl": imageUrl,
    "language": language,
    "identifiers": identifiers?.toMap(),
    "multiverseid": multiverseid,
  };
}