import 'dart:convert';

import '../../domain/entities/ruling_entity.dart';
String nameModelToJson(RulingModel data) => json.encode(data.toMap());
class RulingModel extends RulingEntity {
  const RulingModel({
    super.date,
    super.text,
  });

  factory RulingModel.fromJson(String str) =>
      RulingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RulingModel.fromMap(Map<String, dynamic> json) => RulingModel(
    date: json["date"],
    text: json["text"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "date": date,
    "text": text,
  };
}