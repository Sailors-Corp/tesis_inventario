import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    required this.rotulo,
    required this.subClassification,
    required this.area,
  });

  String rotulo;
  String subClassification;
  String area;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        rotulo: json["rotulo"],
        subClassification: json["subClassification"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "rotulo": rotulo,
        "subClassification": subClassification,
        "area": area,
      };
}
