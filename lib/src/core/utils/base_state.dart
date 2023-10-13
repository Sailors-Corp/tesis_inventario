import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
sealed class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = BaseStateInitial;
  const factory BaseState.loading() = BaseStateLoading;
  const factory BaseState.error({
    @Default('') String message,
  }) = BaseStateError;
  const factory BaseState.empty() = BaseStateEmpty;
  const factory BaseState.success({
    required T data,
  }) = BaseStateSuccess<T>;
}
