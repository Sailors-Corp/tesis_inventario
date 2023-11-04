// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(T data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(T data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateInitial<T> value) initial,
    required TResult Function(BaseStateLoading<T> value) loading,
    required TResult Function(BaseStateError<T> value) error,
    required TResult Function(BaseStateEmpty<T> value) empty,
    required TResult Function(BaseStateSuccess<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateInitial<T> value)? initial,
    TResult? Function(BaseStateLoading<T> value)? loading,
    TResult? Function(BaseStateError<T> value)? error,
    TResult? Function(BaseStateEmpty<T> value)? empty,
    TResult? Function(BaseStateSuccess<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateInitial<T> value)? initial,
    TResult Function(BaseStateLoading<T> value)? loading,
    TResult Function(BaseStateError<T> value)? error,
    TResult Function(BaseStateEmpty<T> value)? empty,
    TResult Function(BaseStateSuccess<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BaseStateInitialImplCopyWith<T, $Res> {
  factory _$$BaseStateInitialImplCopyWith(_$BaseStateInitialImpl<T> value,
          $Res Function(_$BaseStateInitialImpl<T>) then) =
      __$$BaseStateInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BaseStateInitialImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseStateInitialImpl<T>>
    implements _$$BaseStateInitialImplCopyWith<T, $Res> {
  __$$BaseStateInitialImplCopyWithImpl(_$BaseStateInitialImpl<T> _value,
      $Res Function(_$BaseStateInitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BaseStateInitialImpl<T> implements BaseStateInitial<T> {
  const _$BaseStateInitialImpl();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(T data) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(T data)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateInitial<T> value) initial,
    required TResult Function(BaseStateLoading<T> value) loading,
    required TResult Function(BaseStateError<T> value) error,
    required TResult Function(BaseStateEmpty<T> value) empty,
    required TResult Function(BaseStateSuccess<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateInitial<T> value)? initial,
    TResult? Function(BaseStateLoading<T> value)? loading,
    TResult? Function(BaseStateError<T> value)? error,
    TResult? Function(BaseStateEmpty<T> value)? empty,
    TResult? Function(BaseStateSuccess<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateInitial<T> value)? initial,
    TResult Function(BaseStateLoading<T> value)? loading,
    TResult Function(BaseStateError<T> value)? error,
    TResult Function(BaseStateEmpty<T> value)? empty,
    TResult Function(BaseStateSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BaseStateInitial<T> implements BaseState<T> {
  const factory BaseStateInitial() = _$BaseStateInitialImpl<T>;
}

/// @nodoc
abstract class _$$BaseStateLoadingImplCopyWith<T, $Res> {
  factory _$$BaseStateLoadingImplCopyWith(_$BaseStateLoadingImpl<T> value,
          $Res Function(_$BaseStateLoadingImpl<T>) then) =
      __$$BaseStateLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BaseStateLoadingImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseStateLoadingImpl<T>>
    implements _$$BaseStateLoadingImplCopyWith<T, $Res> {
  __$$BaseStateLoadingImplCopyWithImpl(_$BaseStateLoadingImpl<T> _value,
      $Res Function(_$BaseStateLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BaseStateLoadingImpl<T> implements BaseStateLoading<T> {
  const _$BaseStateLoadingImpl();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(T data) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(T data)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateInitial<T> value) initial,
    required TResult Function(BaseStateLoading<T> value) loading,
    required TResult Function(BaseStateError<T> value) error,
    required TResult Function(BaseStateEmpty<T> value) empty,
    required TResult Function(BaseStateSuccess<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateInitial<T> value)? initial,
    TResult? Function(BaseStateLoading<T> value)? loading,
    TResult? Function(BaseStateError<T> value)? error,
    TResult? Function(BaseStateEmpty<T> value)? empty,
    TResult? Function(BaseStateSuccess<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateInitial<T> value)? initial,
    TResult Function(BaseStateLoading<T> value)? loading,
    TResult Function(BaseStateError<T> value)? error,
    TResult Function(BaseStateEmpty<T> value)? empty,
    TResult Function(BaseStateSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BaseStateLoading<T> implements BaseState<T> {
  const factory BaseStateLoading() = _$BaseStateLoadingImpl<T>;
}

/// @nodoc
abstract class _$$BaseStateErrorImplCopyWith<T, $Res> {
  factory _$$BaseStateErrorImplCopyWith(_$BaseStateErrorImpl<T> value,
          $Res Function(_$BaseStateErrorImpl<T>) then) =
      __$$BaseStateErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BaseStateErrorImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseStateErrorImpl<T>>
    implements _$$BaseStateErrorImplCopyWith<T, $Res> {
  __$$BaseStateErrorImplCopyWithImpl(_$BaseStateErrorImpl<T> _value,
      $Res Function(_$BaseStateErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BaseStateErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BaseStateErrorImpl<T> implements BaseStateError<T> {
  const _$BaseStateErrorImpl({this.message = ''});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'BaseState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseStateErrorImplCopyWith<T, _$BaseStateErrorImpl<T>> get copyWith =>
      __$$BaseStateErrorImplCopyWithImpl<T, _$BaseStateErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(T data) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(T data)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateInitial<T> value) initial,
    required TResult Function(BaseStateLoading<T> value) loading,
    required TResult Function(BaseStateError<T> value) error,
    required TResult Function(BaseStateEmpty<T> value) empty,
    required TResult Function(BaseStateSuccess<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateInitial<T> value)? initial,
    TResult? Function(BaseStateLoading<T> value)? loading,
    TResult? Function(BaseStateError<T> value)? error,
    TResult? Function(BaseStateEmpty<T> value)? empty,
    TResult? Function(BaseStateSuccess<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateInitial<T> value)? initial,
    TResult Function(BaseStateLoading<T> value)? loading,
    TResult Function(BaseStateError<T> value)? error,
    TResult Function(BaseStateEmpty<T> value)? empty,
    TResult Function(BaseStateSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BaseStateError<T> implements BaseState<T> {
  const factory BaseStateError({final String message}) =
      _$BaseStateErrorImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$BaseStateErrorImplCopyWith<T, _$BaseStateErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseStateEmptyImplCopyWith<T, $Res> {
  factory _$$BaseStateEmptyImplCopyWith(_$BaseStateEmptyImpl<T> value,
          $Res Function(_$BaseStateEmptyImpl<T>) then) =
      __$$BaseStateEmptyImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BaseStateEmptyImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseStateEmptyImpl<T>>
    implements _$$BaseStateEmptyImplCopyWith<T, $Res> {
  __$$BaseStateEmptyImplCopyWithImpl(_$BaseStateEmptyImpl<T> _value,
      $Res Function(_$BaseStateEmptyImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BaseStateEmptyImpl<T> implements BaseStateEmpty<T> {
  const _$BaseStateEmptyImpl();

  @override
  String toString() {
    return 'BaseState<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BaseStateEmptyImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(T data) success,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(T data)? success,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateInitial<T> value) initial,
    required TResult Function(BaseStateLoading<T> value) loading,
    required TResult Function(BaseStateError<T> value) error,
    required TResult Function(BaseStateEmpty<T> value) empty,
    required TResult Function(BaseStateSuccess<T> value) success,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateInitial<T> value)? initial,
    TResult? Function(BaseStateLoading<T> value)? loading,
    TResult? Function(BaseStateError<T> value)? error,
    TResult? Function(BaseStateEmpty<T> value)? empty,
    TResult? Function(BaseStateSuccess<T> value)? success,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateInitial<T> value)? initial,
    TResult Function(BaseStateLoading<T> value)? loading,
    TResult Function(BaseStateError<T> value)? error,
    TResult Function(BaseStateEmpty<T> value)? empty,
    TResult Function(BaseStateSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class BaseStateEmpty<T> implements BaseState<T> {
  const factory BaseStateEmpty() = _$BaseStateEmptyImpl<T>;
}

/// @nodoc
abstract class _$$BaseStateSuccessImplCopyWith<T, $Res> {
  factory _$$BaseStateSuccessImplCopyWith(_$BaseStateSuccessImpl<T> value,
          $Res Function(_$BaseStateSuccessImpl<T>) then) =
      __$$BaseStateSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$BaseStateSuccessImplCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$BaseStateSuccessImpl<T>>
    implements _$$BaseStateSuccessImplCopyWith<T, $Res> {
  __$$BaseStateSuccessImplCopyWithImpl(_$BaseStateSuccessImpl<T> _value,
      $Res Function(_$BaseStateSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseStateSuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$BaseStateSuccessImpl<T> implements BaseStateSuccess<T> {
  const _$BaseStateSuccessImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseStateSuccessImplCopyWith<T, _$BaseStateSuccessImpl<T>> get copyWith =>
      __$$BaseStateSuccessImplCopyWithImpl<T, _$BaseStateSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() empty,
    required TResult Function(T data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? empty,
    TResult? Function(T data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? empty,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateInitial<T> value) initial,
    required TResult Function(BaseStateLoading<T> value) loading,
    required TResult Function(BaseStateError<T> value) error,
    required TResult Function(BaseStateEmpty<T> value) empty,
    required TResult Function(BaseStateSuccess<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateInitial<T> value)? initial,
    TResult? Function(BaseStateLoading<T> value)? loading,
    TResult? Function(BaseStateError<T> value)? error,
    TResult? Function(BaseStateEmpty<T> value)? empty,
    TResult? Function(BaseStateSuccess<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateInitial<T> value)? initial,
    TResult Function(BaseStateLoading<T> value)? loading,
    TResult Function(BaseStateError<T> value)? error,
    TResult Function(BaseStateEmpty<T> value)? empty,
    TResult Function(BaseStateSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BaseStateSuccess<T> implements BaseState<T> {
  const factory BaseStateSuccess({required final T data}) =
      _$BaseStateSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$BaseStateSuccessImplCopyWith<T, _$BaseStateSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
