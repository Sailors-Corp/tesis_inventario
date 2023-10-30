import 'dart:convert';

MedioBasicoModel itemModelFromJson(String str) =>
    MedioBasicoModel.fromJson(json.decode(str));

String itemModelToJson(MedioBasicoModel data) => json.encode(data.toJson());

class MedioBasicoModel {
  MedioBasicoModel({
    required this.rotulo,
    required this.subClassification,
    required this.area,
  });

  String rotulo;
  String subClassification;
  String area;

  factory MedioBasicoModel.fromJson(Map<String, dynamic> json) =>
      MedioBasicoModel(
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
