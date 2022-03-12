// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feedback_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FeedbackStateTearOff {
  const _$FeedbackStateTearOff();

  _FeedbackState call(
      {required String message,
      required String email,
      required String firsName,
      required bool isValid}) {
    return _FeedbackState(
      message: message,
      email: email,
      firsName: firsName,
      isValid: isValid,
    );
  }
}

/// @nodoc
const $FeedbackState = _$FeedbackStateTearOff();

/// @nodoc
mixin _$FeedbackState {
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firsName => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedbackStateCopyWith<FeedbackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackStateCopyWith<$Res> {
  factory $FeedbackStateCopyWith(
          FeedbackState value, $Res Function(FeedbackState) then) =
      _$FeedbackStateCopyWithImpl<$Res>;
  $Res call({String message, String email, String firsName, bool isValid});
}

/// @nodoc
class _$FeedbackStateCopyWithImpl<$Res>
    implements $FeedbackStateCopyWith<$Res> {
  _$FeedbackStateCopyWithImpl(this._value, this._then);

  final FeedbackState _value;
  // ignore: unused_field
  final $Res Function(FeedbackState) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? email = freezed,
    Object? firsName = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firsName: firsName == freezed
          ? _value.firsName
          : firsName // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FeedbackStateCopyWith<$Res>
    implements $FeedbackStateCopyWith<$Res> {
  factory _$FeedbackStateCopyWith(
          _FeedbackState value, $Res Function(_FeedbackState) then) =
      __$FeedbackStateCopyWithImpl<$Res>;
  @override
  $Res call({String message, String email, String firsName, bool isValid});
}

/// @nodoc
class __$FeedbackStateCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res>
    implements _$FeedbackStateCopyWith<$Res> {
  __$FeedbackStateCopyWithImpl(
      _FeedbackState _value, $Res Function(_FeedbackState) _then)
      : super(_value, (v) => _then(v as _FeedbackState));

  @override
  _FeedbackState get _value => super._value as _FeedbackState;

  @override
  $Res call({
    Object? message = freezed,
    Object? email = freezed,
    Object? firsName = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_FeedbackState(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firsName: firsName == freezed
          ? _value.firsName
          : firsName // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FeedbackState implements _FeedbackState {
  const _$_FeedbackState(
      {required this.message,
      required this.email,
      required this.firsName,
      required this.isValid});

  @override
  final String message;
  @override
  final String email;
  @override
  final String firsName;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'FeedbackState(message: $message, email: $email, firsName: $firsName, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedbackState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firsName, firsName) ||
                const DeepCollectionEquality()
                    .equals(other.firsName, firsName)) &&
            (identical(other.isValid, isValid) ||
                const DeepCollectionEquality().equals(other.isValid, isValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firsName) ^
      const DeepCollectionEquality().hash(isValid);

  @JsonKey(ignore: true)
  @override
  _$FeedbackStateCopyWith<_FeedbackState> get copyWith =>
      __$FeedbackStateCopyWithImpl<_FeedbackState>(this, _$identity);
}

abstract class _FeedbackState implements FeedbackState {
  const factory _FeedbackState(
      {required String message,
      required String email,
      required String firsName,
      required bool isValid}) = _$_FeedbackState;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get firsName => throw _privateConstructorUsedError;
  @override
  bool get isValid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedbackStateCopyWith<_FeedbackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FeedbackEventTearOff {
  const _$FeedbackEventTearOff();

  _SetEmail setEmal(String email) {
    return _SetEmail(
      email,
    );
  }

  _SetMessage setMessage(String message) {
    return _SetMessage(
      message,
    );
  }

  _FirstName setFirstName(String firstName) {
    return _FirstName(
      firstName,
    );
  }

  _IsValid isValid(bool isValid) {
    return _IsValid(
      isValid,
    );
  }
}

/// @nodoc
const $FeedbackEvent = _$FeedbackEventTearOff();

/// @nodoc
mixin _$FeedbackEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) setEmal,
    required TResult Function(String message) setMessage,
    required TResult Function(String firstName) setFirstName,
    required TResult Function(bool isValid) isValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmal,
    required TResult Function(_SetMessage value) setMessage,
    required TResult Function(_FirstName value) setFirstName,
    required TResult Function(_IsValid value) isValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackEventCopyWith<$Res> {
  factory $FeedbackEventCopyWith(
          FeedbackEvent value, $Res Function(FeedbackEvent) then) =
      _$FeedbackEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedbackEventCopyWithImpl<$Res>
    implements $FeedbackEventCopyWith<$Res> {
  _$FeedbackEventCopyWithImpl(this._value, this._then);

  final FeedbackEvent _value;
  // ignore: unused_field
  final $Res Function(FeedbackEvent) _then;
}

/// @nodoc
abstract class _$SetEmailCopyWith<$Res> {
  factory _$SetEmailCopyWith(_SetEmail value, $Res Function(_SetEmail) then) =
      __$SetEmailCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$SetEmailCopyWithImpl<$Res> extends _$FeedbackEventCopyWithImpl<$Res>
    implements _$SetEmailCopyWith<$Res> {
  __$SetEmailCopyWithImpl(_SetEmail _value, $Res Function(_SetEmail) _then)
      : super(_value, (v) => _then(v as _SetEmail));

  @override
  _SetEmail get _value => super._value as _SetEmail;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_SetEmail(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetEmail implements _SetEmail {
  const _$_SetEmail(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'FeedbackEvent.setEmal(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$SetEmailCopyWith<_SetEmail> get copyWith =>
      __$SetEmailCopyWithImpl<_SetEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) setEmal,
    required TResult Function(String message) setMessage,
    required TResult Function(String firstName) setFirstName,
    required TResult Function(bool isValid) isValid,
  }) {
    return setEmal(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
  }) {
    return setEmal?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
    required TResult orElse(),
  }) {
    if (setEmal != null) {
      return setEmal(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmal,
    required TResult Function(_SetMessage value) setMessage,
    required TResult Function(_FirstName value) setFirstName,
    required TResult Function(_IsValid value) isValid,
  }) {
    return setEmal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
  }) {
    return setEmal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
    required TResult orElse(),
  }) {
    if (setEmal != null) {
      return setEmal(this);
    }
    return orElse();
  }
}

abstract class _SetEmail implements FeedbackEvent {
  const factory _SetEmail(String email) = _$_SetEmail;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetEmailCopyWith<_SetEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SetMessageCopyWith<$Res> {
  factory _$SetMessageCopyWith(
          _SetMessage value, $Res Function(_SetMessage) then) =
      __$SetMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SetMessageCopyWithImpl<$Res> extends _$FeedbackEventCopyWithImpl<$Res>
    implements _$SetMessageCopyWith<$Res> {
  __$SetMessageCopyWithImpl(
      _SetMessage _value, $Res Function(_SetMessage) _then)
      : super(_value, (v) => _then(v as _SetMessage));

  @override
  _SetMessage get _value => super._value as _SetMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SetMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetMessage implements _SetMessage {
  const _$_SetMessage(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FeedbackEvent.setMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$SetMessageCopyWith<_SetMessage> get copyWith =>
      __$SetMessageCopyWithImpl<_SetMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) setEmal,
    required TResult Function(String message) setMessage,
    required TResult Function(String firstName) setFirstName,
    required TResult Function(bool isValid) isValid,
  }) {
    return setMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
  }) {
    return setMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
    required TResult orElse(),
  }) {
    if (setMessage != null) {
      return setMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmal,
    required TResult Function(_SetMessage value) setMessage,
    required TResult Function(_FirstName value) setFirstName,
    required TResult Function(_IsValid value) isValid,
  }) {
    return setMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
  }) {
    return setMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
    required TResult orElse(),
  }) {
    if (setMessage != null) {
      return setMessage(this);
    }
    return orElse();
  }
}

abstract class _SetMessage implements FeedbackEvent {
  const factory _SetMessage(String message) = _$_SetMessage;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetMessageCopyWith<_SetMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FirstNameCopyWith<$Res> {
  factory _$FirstNameCopyWith(
          _FirstName value, $Res Function(_FirstName) then) =
      __$FirstNameCopyWithImpl<$Res>;
  $Res call({String firstName});
}

/// @nodoc
class __$FirstNameCopyWithImpl<$Res> extends _$FeedbackEventCopyWithImpl<$Res>
    implements _$FirstNameCopyWith<$Res> {
  __$FirstNameCopyWithImpl(_FirstName _value, $Res Function(_FirstName) _then)
      : super(_value, (v) => _then(v as _FirstName));

  @override
  _FirstName get _value => super._value as _FirstName;

  @override
  $Res call({
    Object? firstName = freezed,
  }) {
    return _then(_FirstName(
      firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FirstName implements _FirstName {
  const _$_FirstName(this.firstName);

  @override
  final String firstName;

  @override
  String toString() {
    return 'FeedbackEvent.setFirstName(firstName: $firstName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FirstName &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(firstName);

  @JsonKey(ignore: true)
  @override
  _$FirstNameCopyWith<_FirstName> get copyWith =>
      __$FirstNameCopyWithImpl<_FirstName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) setEmal,
    required TResult Function(String message) setMessage,
    required TResult Function(String firstName) setFirstName,
    required TResult Function(bool isValid) isValid,
  }) {
    return setFirstName(firstName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
  }) {
    return setFirstName?.call(firstName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
    required TResult orElse(),
  }) {
    if (setFirstName != null) {
      return setFirstName(firstName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmal,
    required TResult Function(_SetMessage value) setMessage,
    required TResult Function(_FirstName value) setFirstName,
    required TResult Function(_IsValid value) isValid,
  }) {
    return setFirstName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
  }) {
    return setFirstName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
    required TResult orElse(),
  }) {
    if (setFirstName != null) {
      return setFirstName(this);
    }
    return orElse();
  }
}

abstract class _FirstName implements FeedbackEvent {
  const factory _FirstName(String firstName) = _$_FirstName;

  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FirstNameCopyWith<_FirstName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$IsValidCopyWith<$Res> {
  factory _$IsValidCopyWith(_IsValid value, $Res Function(_IsValid) then) =
      __$IsValidCopyWithImpl<$Res>;
  $Res call({bool isValid});
}

/// @nodoc
class __$IsValidCopyWithImpl<$Res> extends _$FeedbackEventCopyWithImpl<$Res>
    implements _$IsValidCopyWith<$Res> {
  __$IsValidCopyWithImpl(_IsValid _value, $Res Function(_IsValid) _then)
      : super(_value, (v) => _then(v as _IsValid));

  @override
  _IsValid get _value => super._value as _IsValid;

  @override
  $Res call({
    Object? isValid = freezed,
  }) {
    return _then(_IsValid(
      isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IsValid implements _IsValid {
  const _$_IsValid(this.isValid);

  @override
  final bool isValid;

  @override
  String toString() {
    return 'FeedbackEvent.isValid(isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IsValid &&
            (identical(other.isValid, isValid) ||
                const DeepCollectionEquality().equals(other.isValid, isValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isValid);

  @JsonKey(ignore: true)
  @override
  _$IsValidCopyWith<_IsValid> get copyWith =>
      __$IsValidCopyWithImpl<_IsValid>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) setEmal,
    required TResult Function(String message) setMessage,
    required TResult Function(String firstName) setFirstName,
    required TResult Function(bool isValid) isValid,
  }) {
    return isValid(this.isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
  }) {
    return isValid?.call(this.isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? setEmal,
    TResult Function(String message)? setMessage,
    TResult Function(String firstName)? setFirstName,
    TResult Function(bool isValid)? isValid,
    required TResult orElse(),
  }) {
    if (isValid != null) {
      return isValid(this.isValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmal,
    required TResult Function(_SetMessage value) setMessage,
    required TResult Function(_FirstName value) setFirstName,
    required TResult Function(_IsValid value) isValid,
  }) {
    return isValid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
  }) {
    return isValid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmal,
    TResult Function(_SetMessage value)? setMessage,
    TResult Function(_FirstName value)? setFirstName,
    TResult Function(_IsValid value)? isValid,
    required TResult orElse(),
  }) {
    if (isValid != null) {
      return isValid(this);
    }
    return orElse();
  }
}

abstract class _IsValid implements FeedbackEvent {
  const factory _IsValid(bool isValid) = _$_IsValid;

  bool get isValid => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$IsValidCopyWith<_IsValid> get copyWith =>
      throw _privateConstructorUsedError;
}
