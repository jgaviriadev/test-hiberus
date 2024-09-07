import 'dart:convert';

import '../../domain/entities/card_entity.dart';
import 'models.dart';

class CardModel extends CardEntity {
  const CardModel({
    super.name,
    super.manaCost,
    super.cmc,
    super.colors,
    super.colorIdentity,
    super.type,
    super.types,
    super.subtypes,
    super.rarity,
    super.cardSet,
    super.setName,
    super.text,
    super.artist,
    super.number,
    super.power,
    super.toughness,
    super.layout,
    super.multiverseid,
    super.imageUrl,
    super.variations,
    List<ForeignNameModel>? super.foreignNames,
    super.printings,
    super.originalText,
    super.originalType,
    List<LegalityModel>? super.legalities,
    super.id,
    super.flavor,
    List<RulingModel>? super.rulings,
    super.supertypes,
  });

  factory CardModel.fromJson(String str) =>
      CardModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardModel.fromMap(Map<String, dynamic> json) => CardModel(
    name: json["name"],
    manaCost: json["manaCost"],
    cmc: json["cmc"],
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
    foreignNames: json["foreignNames"] == null ? [] : List<ForeignNameModel>.from(json["foreignNames"]!.map((x) => ForeignNameModel.fromMap(x))),
    printings: json["printings"] == null ? [] : List<String>.from(json["printings"]!.map((x) => x)),
    originalText: json["originalText"],
    originalType: json["originalType"],
    legalities: json["legalities"] == null ? [] : List<LegalityModel>.from(json["legalities"]!.map((x) => LegalityModel.fromMap(x))),
    id: json["id"],
    flavor: json["flavor"],
    rulings: json["rulings"] == null ? [] : List<RulingModel>.from(json["rulings"]!.map((x) => RulingModel.fromMap(x))),
    supertypes: json["supertypes"] == null ? [] : List<String>.from(json["supertypes"]!.map((x) => x)),
  );

  @override
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
}