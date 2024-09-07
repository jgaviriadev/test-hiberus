import 'package:equatable/equatable.dart';

import '../../data/models/foreign_name_model.dart';
import 'identifiers_entity.dart';

class ForeignNameEntity extends Equatable {
  final String? name;
  final String? text;
  final String? type;
  final String? flavor;
  final String? imageUrl;
  final String? language;
  final IdentifiersEntity? identifiers;
  final int? multiverseid;

  const ForeignNameEntity({
    this.name,
    this.text,
    this.type,
    this.flavor,
    this.imageUrl,
    this.language,
    this.identifiers,
    this.multiverseid,
  });

  ForeignNameEntity copyWith({
    String? name,
    String? text,
    String? type,
    String? flavor,
    String? imageUrl,
    String? language,
    IdentifiersEntity? identifiers,
    int? multiverseid,
  }) =>
      ForeignNameEntity(
        name: name ?? this.name,
        text: text ?? this.text,
        type: type ?? this.type,
        flavor: flavor ?? this.flavor,
        imageUrl: imageUrl ?? this.imageUrl,
        language: language ?? this.language,
        identifiers: identifiers ?? this.identifiers,
        multiverseid: multiverseid ?? this.multiverseid,
      );

  factory ForeignNameEntity.fromMap(Map<String, dynamic> json) => ForeignNameEntity(
        name: json["name"],
        text: json["text"],
        type: json["type"],
        flavor: json["flavor"],
        imageUrl: json["imageUrl"],
        language: json["language"],
        identifiers: json["identifiers"] == null ? null : IdentifiersEntity.fromMap(json["identifiers"]),
        multiverseid: json["multiverseid"],
      );

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

  factory ForeignNameEntity.modelToEntity(ForeignNameModel data) => ForeignNameEntity.fromMap(data.toMap());

  @override
  List<Object?> get props => [
        name,
        text,
        type,
        flavor,
        imageUrl,
        language,
        identifiers,
        multiverseid,
      ];
}
