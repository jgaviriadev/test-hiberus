import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class LegalityEntity extends Equatable {
  final String? format;
  final String? legality;

  const LegalityEntity({
    this.format,
    this.legality,
  });

  LegalityEntity copyWith({
    String? format,
    String? legality,
  }) =>
      LegalityEntity(
        format: format ?? this.format,
        legality: legality ?? this.legality,
      );

  factory LegalityEntity.fromMap(Map<String, dynamic> json) => LegalityEntity(
        format: json["format"],
        legality: json["legality"],
      );

  Map<String, dynamic> toMap() => {
        "format": format,
        "legality": legality,
      };

  factory LegalityEntity.modelToEntity(LegalityModel data) => LegalityEntity.fromMap(data.toMap());

  @override
  List<Object?> get props => [
        format,
        legality,
      ];
}
