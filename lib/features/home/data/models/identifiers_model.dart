import 'dart:convert';

import '../../domain/entities/identifiers_entity.dart';

class IdentifiersModel extends IdentifiersEntity {
  const IdentifiersModel({
        super.scryfallId,
        super.multiverseId,
  });

  factory IdentifiersModel.fromJson(String str) =>
      IdentifiersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdentifiersModel.fromMap(Map<String, dynamic> json) => IdentifiersModel(
    scryfallId: json["scryfallId"],
    multiverseId: json["multiverseId"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "scryfallId": scryfallId,
    "multiverseId": multiverseId,
  };
}