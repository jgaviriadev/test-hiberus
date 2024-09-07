import 'package:equatable/equatable.dart';

import '../../data/models/card_model.dart';
import 'entities.dart';

class CardEntity extends  Equatable {
  final String? name;
  final String? manaCost;
  final double? cmc;
  final List<String>? colors;
  final List<String>? colorIdentity;
  final String? type;
  final List<String>? types;
  final List<String>? subtypes;
  final String? rarity;
  final String? cardSet;
  final String? setName;
  final String? text;
  final String? artist;
  final String? number;
  final String? power;
  final String? toughness;
  final String? layout;
  final String? multiverseid;
  final String? imageUrl;
  final List<String>? variations;
  final List<ForeignNameEntity>? foreignNames;
  final List<String>? printings;
  final String? originalText;
  final String? originalType;
  final List<LegalityEntity>? legalities;
  final String? id;
  final String? flavor;
  final List<RulingEntity>? rulings;
  final List<String>? supertypes;

  const CardEntity({
    this.name,
    this.manaCost,
    this.cmc,
    this.colors,this.colorIdentity,
    this.type,
    this.types,
    this.subtypes,
    this.rarity,
    this.cardSet,
    this.setName,
    this.text,
    this.artist,
    this.number,
    this.power,
    this.toughness,
    this.layout,
    this.multiverseid,
    this.imageUrl,
    this.variations,
    this.foreignNames,
    this.printings,
    this.originalText,
    this.originalType,
    this.legalities,
    this.id,
    this.flavor,
    this.rulings,
    this.supertypes,
  });

  CardEntity copyWith({
    String? name,
    String? manaCost,
    double? cmc,
    List<String>? colors,
    List<String>? colorIdentity,
    String? type,
    List<String>? types,
    List<String>? subtypes,
    String? rarity,
    String? cardSet,
    String? setName,
    String? text,
    String? artist,
    String? number,
    String? power,
    String? toughness,
    String? layout,
    String? multiverseid,
    String? imageUrl,
    List<String>? variations,
    List<ForeignNameEntity>? foreignNames,
    List<String>? printings,
    String? originalText,
    String? originalType,
    List<LegalityEntity>? legalities,
    String? id,
    String? flavor,
    List<RulingEntity>? rulings,
    List<String>? supertypes,
  }) =>
      CardEntity(
        name: name ?? this.name,
        manaCost: manaCost ?? this.manaCost,
        cmc: cmc ?? this.cmc,
        colors: colors ?? this.colors,
        colorIdentity: colorIdentity ?? this.colorIdentity,
        type: type ?? this.type,
        types: types ?? this.types,
        subtypes: subtypes ?? this.subtypes,
        rarity: rarity ?? this.rarity,
        cardSet: cardSet ?? this.cardSet,
        setName: setName ?? this.setName,
        text: text ?? this.text,
        artist: artist ?? this.artist,
        number: number ?? this.number,
        power: power ?? this.power,
        toughness: toughness ?? this.toughness,
        layout: layout ?? this.layout,
        multiverseid: multiverseid ?? this.multiverseid,
        imageUrl: imageUrl ?? this.imageUrl,
        variations: variations ?? this.variations,
        foreignNames: foreignNames ?? this.foreignNames,
        printings: printings ?? this.printings,
        originalText: originalText ?? this.originalText,
        originalType: originalType ?? this.originalType,
        legalities: legalities ?? this.legalities,
        id: id ?? this.id,
        flavor: flavor ?? this.flavor,
        rulings: rulings ?? this.rulings,
        supertypes: supertypes ?? this.supertypes,
      );

  factory CardEntity.fromMap(Map<String, dynamic> json) => CardEntity(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"]?.toDouble(),
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        colorIdentity: json["colorIdentity"] == null ? [] : List<String>.from(json["colorIdentity"]!.map((x) => x)),
        type: json["type"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
        subtypes: json["subtypes"] == null ? [] : List<String>.from(json["subtypes"]!.map((x) => x)),
        rarity: json["rarity"],
        cardSet: json["set"],
        setName: json["setName"],
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        layout: json["layout"],
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"],
        variations: json["variations"] == null ? [] : List<String>.from(json["variations"]!.map((x) => x)),
        foreignNames: json["foreignNames"] == null ? [] : List<ForeignNameEntity>.from(json["foreignNames"]!.map((x) => ForeignNameEntity.fromMap(x))),
        printings: json["printings"] == null ? [] : List<String>.from(json["printings"]!.map((x) => x)),
        originalText: json["originalText"],
        originalType: json["originalType"],
        legalities: json["legalities"] == null ? [] : List<LegalityEntity>.from(json["legalities"]!.map((x) => LegalityEntity.fromMap(x))),
        id: json["id"],
        flavor: json["flavor"],
        rulings: json["rulings"] == null ? [] : List<RulingEntity>.from(json["rulings"]!.map((x) => RulingEntity.fromMap(x))),
        supertypes: json["supertypes"] == null ? [] : List<String>.from(json["supertypes"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "manaCost": manaCost,
        "cmc": cmc,
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "colorIdentity": colorIdentity == null ? [] : List<dynamic>.from(colorIdentity!.map((x) => x)),
        "type": type,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "subtypes": subtypes == null ? [] : List<dynamic>.from(subtypes!.map((x) => x)),
        "rarity": rarity,
        "set": cardSet,
        "setName": setName,
        "text": text,
        "artist": artist,
        "number": number,
        "power": power,
        "toughness": toughness,
        "layout": layout,
        "multiverseid": multiverseid,
        "imageUrl": imageUrl,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
        "foreignNames": foreignNames == null ? [] : List<dynamic>.from(foreignNames!.map((x) => x.toMap())),
        "printings": printings == null ? [] : List<dynamic>.from(printings!.map((x) => x)),
        "originalText": originalText,
        "originalType": originalType,
        "legalities": legalities == null ? [] : List<dynamic>.from(legalities!.map((x) => x.toMap())),
        "id": id,
        "flavor": flavor,
        "rulings": rulings == null ? [] : List<dynamic>.from(rulings!.map((x) => x.toMap())),
        "supertypes": supertypes == null ? [] : List<dynamic>.from(supertypes!.map((x) => x)),
      };

  factory CardEntity.modelToEntity(CardModel data) => CardEntity.fromMap(data.toMap());

  @override
  List<Object?> get props => [
    name,
    manaCost,
    cmc,
    colors,
    colorIdentity,
    type,
    types,
    subtypes,
    rarity,
    cardSet,
    setName,
    text,
    artist,
    number,
    power,
    toughness,
    layout,
    multiverseid,
    imageUrl,
    variations,
    foreignNames,
    printings,
    originalText,
    originalType,
    legalities,
    id,
    flavor,
    rulings,
    supertypes,
  ];
}
