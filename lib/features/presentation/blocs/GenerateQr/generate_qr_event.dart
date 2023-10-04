part of 'generate_qr_bloc.dart';

@immutable
abstract class GenerateQREvent {}

class GenerateQr extends GenerateQREvent {
  final String nombre;
  final String subClasificacion;
  final String rotulo;

  GenerateQr(this.nombre, this.subClasificacion, this.rotulo);
}
