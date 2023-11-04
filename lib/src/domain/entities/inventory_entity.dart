import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/data/db/database.dart';

class InventoryEntity extends Equatable {
  const InventoryEntity({
    required this.correctMedios,
    required this.incorrectMedios,
  });

  final List<InventarioTableEntity> correctMedios;
  final List<InventarioTableEntity> incorrectMedios;

  @override
  List<Object?> get props => [
        correctMedios,
        incorrectMedios,
      ];
}
