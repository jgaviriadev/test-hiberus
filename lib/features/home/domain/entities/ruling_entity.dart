import 'package:equatable/equatable.dart';

import '../../data/models/ruling_model.dart';

class RulingEntity extends Equatable {
  final String? date;
  final String? text;

  const RulingEntity({
    this.date,
    this.text,
  });

  RulingEntity copyWith({
    String? date,
    String? text,
  }) =>
      RulingEntity(
        date: date ?? this.date,
        text: text ?? this.text,
      );

  factory RulingEntity.fromMap(Map<String, dynamic> json) => RulingEntity(
        date: json["date"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "text": text,
      };

  factory RulingEntity.modelToEntity(RulingModel data) => RulingEntity.fromMap(data.toMap());

  @override
  List<Object?> get props => [
        date,
        text,
      ];
}
