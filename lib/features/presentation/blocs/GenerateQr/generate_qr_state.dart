// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'generate_qr_bloc.dart';

@immutable
class GenerateQRState {
  final QrImageView? qr;
  final String? subClassification;

  const GenerateQRState({
    this.qr,
    this.subClassification,
  });

  GenerateQRState copyWith({
    QrImageView? qr,
    String? subClassification,
  }) {
    return GenerateQRState(
      qr: qr ?? this.qr,
      subClassification: subClassification ?? this.subClassification,
    );
  }
}

class LoadingGenerateQRState extends GenerateQRState {}

class SuccessfulGenerateQRState extends GenerateQRState {}

class FailureGenerateQRState extends GenerateQRState {
  final String error;

  const FailureGenerateQRState(this.error);
}
