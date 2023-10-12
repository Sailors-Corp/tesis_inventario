part of 'generate_qr_bloc.dart';

@immutable
abstract class GenerateQREvent {}

class GenerateQr extends GenerateQREvent {
  final String area;
  final String subClassification;
  final String rotulo;

  GenerateQr(this.area, this.subClassification, this.rotulo);
}
