import 'dart:convert';

import '../../domain/entities/legaly_entity.dart';

class LegalityModel extends LegalityEntity {
  const LegalityModel({
    super.format,
    super.legality,
  });

  factory LegalityModel.fromJson(String str) =>
      LegalityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LegalityModel.fromMap(Map<String, dynamic> json) => LegalityModel(
    format: json["format"],
    legality: json["legality"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "format": format,
    "legality": legality,
  };
}