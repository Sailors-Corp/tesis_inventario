import 'package:equatable/equatable.dart';

class MovementEntity extends Equatable {
  const MovementEntity(
      {required this.entity,
      required this.costCenter,
      required this.area,
      required this.description,
      required this.name,
      required this.role,
      required this.idMedio,
      required this.type,
      required this.subclassification});

  final String entity;
  final String costCenter;
  final String area;
  final String description;
  final String name;
  final String role;
  final String idMedio;
  final String type;
  final String subclassification;

  @override
  List<Object?> get props => [
        entity,
        costCenter,
        area,
        description,
        name,
        role,
        idMedio,
        type,
        subclassification,
      ];
}
