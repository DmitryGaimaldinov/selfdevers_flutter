// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateNoteState {
  bool get isSending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNoteStateCopyWith<CreateNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoteStateCopyWith<$Res> {
  factory $CreateNoteStateCopyWith(
          CreateNoteState value, $Res Function(CreateNoteState) then) =
      _$CreateNoteStateCopyWithImpl<$Res, CreateNoteState>;
  @useResult
  $Res call({bool isSending});
}

/// @nodoc
class _$CreateNoteStateCopyWithImpl<$Res, $Val extends CreateNoteState>
    implements $CreateNoteStateCopyWith<$Res> {
  _$CreateNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSending = null,
  }) {
    return _then(_value.copyWith(
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNoteStateCopyWith<$Res>
    implements $CreateNoteStateCopyWith<$Res> {
  factory _$$_CreateNoteStateCopyWith(
          _$_CreateNoteState value, $Res Function(_$_CreateNoteState) then) =
      __$$_CreateNoteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSending});
}

/// @nodoc
class __$$_CreateNoteStateCopyWithImpl<$Res>
    extends _$CreateNoteStateCopyWithImpl<$Res, _$_CreateNoteState>
    implements _$$_CreateNoteStateCopyWith<$Res> {
  __$$_CreateNoteStateCopyWithImpl(
      _$_CreateNoteState _value, $Res Function(_$_CreateNoteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSending = null,
  }) {
    return _then(_$_CreateNoteState(
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateNoteState implements _CreateNoteState {
  const _$_CreateNoteState({required this.isSending});

  @override
  final bool isSending;

  @override
  String toString() {
    return 'CreateNoteState(isSending: $isSending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNoteState &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNoteStateCopyWith<_$_CreateNoteState> get copyWith =>
      __$$_CreateNoteStateCopyWithImpl<_$_CreateNoteState>(this, _$identity);
}

abstract class _CreateNoteState implements CreateNoteState {
  const factory _CreateNoteState({required final bool isSending}) =
      _$_CreateNoteState;

  @override
  bool get isSending;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNoteStateCopyWith<_$_CreateNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
