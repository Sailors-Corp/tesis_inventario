import 'dart:convert';

import 'package:equatable/equatable.dart';

class MedioEntity extends Equatable {
  const MedioEntity({
    required this.rotulo,
    required this.area,
    required this.subclassification,
    required this.cant,
  });

  final String rotulo;
  final String area;
  final String subclassification;
  final int cant;

  MedioEntity copyWith({
    String? rotulo,
    String? area,
    String? subclassification,
    int? cant,
  }) {
    return MedioEntity(
      rotulo: rotulo ?? this.rotulo,
      area: area ?? this.area,
      subclassification: subclassification ?? this.subclassification,
      cant: cant ?? this.cant,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rotulo': rotulo,
      'area': area,
      'subclassification': subclassification,
      'cant': cant,
    };
  }

  factory MedioEntity.fromMap(Map<String, dynamic> map) {
    return MedioEntity(
      rotulo: map['rotulo'] as String,
      area: map['area'] as String,
      subclassification: map['subclassification'] as String,
      cant: map['cant'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedioEntity.fromJson(String source) =>
      MedioEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedioEntity(rotulo: $rotulo, area: $area, subclassification: $subclassification, cant: $cant)';
  }

  @override
  bool operator ==(covariant MedioEntity other) {
    if (identical(this, other)) return true;

    return other.rotulo == rotulo &&
        other.area == area &&
        other.subclassification == subclassification &&
        other.cant == cant;
  }

  @override
  int get hashCode {
    return rotulo.hashCode ^
        area.hashCode ^
        subclassification.hashCode ^
        cant.hashCode;
  }

  @override
  List<Object?> get props => [rotulo, area, subclassification, cant];
}
