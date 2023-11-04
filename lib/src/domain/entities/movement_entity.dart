import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';

class MovementEntity extends Equatable {
  const MovementEntity({
    required this.entity,
    required this.costCenter,
    required this.area,
    required this.description,
    required this.medios,
    required this.name,
    required this.role,
    required this.type,
  });

  final String entity;
  final String costCenter;
  final String area;
  final String description;
  final String name;
  final String role;
  final TypeMovement type;
  final List<MedioEntity> medios;

  @override
  List<Object?> get props => [
        entity,
        costCenter,
        area,
        description,
        name,
        medios,
        role,
        type,
      ];
}
