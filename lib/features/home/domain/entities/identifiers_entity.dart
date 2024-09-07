import 'package:equatable/equatable.dart';

import '../../data/models/identifiers_model.dart';

class IdentifiersEntity extends Equatable {
    final String? scryfallId;
    final int? multiverseId;

    const IdentifiersEntity({
        this.scryfallId,
        this.multiverseId,
    });

    IdentifiersEntity copyWith({
        String? scryfallId,
        int? multiverseId,
    }) => 
        IdentifiersEntity(
            scryfallId: scryfallId ?? this.scryfallId,
            multiverseId: multiverseId ?? this.multiverseId,
        );

    factory IdentifiersEntity.fromMap(Map<String, dynamic> json) => IdentifiersEntity(
        scryfallId: json["scryfallId"],
        multiverseId: json["multiverseId"],
    );

    Map<String, dynamic> toMap() => {
        "scryfallId": scryfallId,
        "multiverseId": multiverseId,
    };

  factory IdentifiersEntity.modelToEntity(IdentifiersModel data) => IdentifiersEntity.fromMap(data.toMap());

  @override
  List<Object?> get props => [
    scryfallId,
    multiverseId,
  ];
}