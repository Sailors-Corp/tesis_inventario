import 'package:equatable/equatable.dart';

sealed class Result<T> extends Equatable {}

final class Success<T> extends Result<T> {
  Success({required this.data});

  final T data;

  @override
  List<Object?> get props => [data];
}

class Failure<T> extends Result<T> {
  Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
