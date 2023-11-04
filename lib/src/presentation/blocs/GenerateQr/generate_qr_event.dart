part of 'generate_qr_bloc.dart';

@immutable
abstract class GenerateQREvent {}

class GenerateQr extends GenerateQREvent {
  final MedioFormEntity medioFormEntity;

  GenerateQr({required this.medioFormEntity});

}
