// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userTag => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get registerDate => throw _privateConstructorUsedError;
  ImageDto? get avatar => throw _privateConstructorUsedError;
  ImageDto? get background => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  UserCountersDto get counters => throw _privateConstructorUsedError;
  bool get isMe => throw _privateConstructorUsedError;
  FollowStateDto get followState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String userTag,
      String description,
      DateTime registerDate,
      ImageDto? avatar,
      ImageDto? background,
      bool isPrivate,
      UserCountersDto counters,
      bool isMe,
      FollowStateDto followState});

  $ImageDtoCopyWith<$Res>? get avatar;
  $ImageDtoCopyWith<$Res>? get background;
  $UserCountersDtoCopyWith<$Res> get counters;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userTag = null,
    Object? description = null,
    Object? registerDate = null,
    Object? avatar = freezed,
    Object? background = freezed,
    Object? isPrivate = null,
    Object? counters = null,
    Object? isMe = null,
    Object? followState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userTag: null == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      registerDate: null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageDto?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as ImageDto?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      counters: null == counters
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as UserCountersDto,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      followState: null == followState
          ? _value.followState
          : followState // ignore: cast_nullable_to_non_nullable
              as FollowStateDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDtoCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $ImageDtoCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDtoCopyWith<$Res>? get background {
    if (_value.background == null) {
      return null;
    }

    return $ImageDtoCopyWith<$Res>(_value.background!, (value) {
      return _then(_value.copyWith(background: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCountersDtoCopyWith<$Res> get counters {
    return $UserCountersDtoCopyWith<$Res>(_value.counters, (value) {
      return _then(_value.copyWith(counters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UserDtoCopyWith(
          _$_UserDto value, $Res Function(_$_UserDto) then) =
      __$$_UserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String userTag,
      String description,
      DateTime registerDate,
      ImageDto? avatar,
      ImageDto? background,
      bool isPrivate,
      UserCountersDto counters,
      bool isMe,
      FollowStateDto followState});

  @override
  $ImageDtoCopyWith<$Res>? get avatar;
  @override
  $ImageDtoCopyWith<$Res>? get background;
  @override
  $UserCountersDtoCopyWith<$Res> get counters;
}

/// @nodoc
class __$$_UserDtoCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$_UserDto>
    implements _$$_UserDtoCopyWith<$Res> {
  __$$_UserDtoCopyWithImpl(_$_UserDto _value, $Res Function(_$_UserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userTag = null,
    Object? description = null,
    Object? registerDate = null,
    Object? avatar = freezed,
    Object? background = freezed,
    Object? isPrivate = null,
    Object? counters = null,
    Object? isMe = null,
    Object? followState = null,
  }) {
    return _then(_$_UserDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userTag: null == userTag
          ? _value.userTag
          : userTag // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      registerDate: null == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as ImageDto?,
      background: freezed == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as ImageDto?,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      counters: null == counters
          ? _value.counters
          : counters // ignore: cast_nullable_to_non_nullable
              as UserCountersDto,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      followState: null == followState
          ? _value.followState
          : followState // ignore: cast_nullable_to_non_nullable
              as FollowStateDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto implements _UserDto {
  _$_UserDto(
      {required this.id,
      required this.name,
      required this.userTag,
      required this.description,
      required this.registerDate,
      this.avatar,
      this.background,
      required this.isPrivate,
      required this.counters,
      required this.isMe,
      required this.followState});

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String userTag;
  @override
  final String description;
  @override
  final DateTime registerDate;
  @override
  final ImageDto? avatar;
  @override
  final ImageDto? background;
  @override
  final bool isPrivate;
  @override
  final UserCountersDto counters;
  @override
  final bool isMe;
  @override
  final FollowStateDto followState;

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, userTag: $userTag, description: $description, registerDate: $registerDate, avatar: $avatar, background: $background, isPrivate: $isPrivate, counters: $counters, isMe: $isMe, followState: $followState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userTag, userTag) || other.userTag == userTag) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.counters, counters) ||
                other.counters == counters) &&
            (identical(other.isMe, isMe) || other.isMe == isMe) &&
            (identical(other.followState, followState) ||
                other.followState == followState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userTag, description,
      registerDate, avatar, background, isPrivate, counters, isMe, followState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      __$$_UserDtoCopyWithImpl<_$_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  factory _UserDto(
      {required final int id,
      required final String name,
      required final String userTag,
      required final String description,
      required final DateTime registerDate,
      final ImageDto? avatar,
      final ImageDto? background,
      required final bool isPrivate,
      required final UserCountersDto counters,
      required final bool isMe,
      required final FollowStateDto followState}) = _$_UserDto;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get userTag;
  @override
  String get description;
  @override
  DateTime get registerDate;
  @override
  ImageDto? get avatar;
  @override
  ImageDto? get background;
  @override
  bool get isPrivate;
  @override
  UserCountersDto get counters;
  @override
  bool get isMe;
  @override
  FollowStateDto get followState;
  @override
  @JsonKey(ignore: true)
  _$$_UserDtoCopyWith<_$_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

UserCountersDto _$UserCountersDtoFromJson(Map<String, dynamic> json) {
  return _UserCountersDto.fromJson(json);
}

/// @nodoc
mixin _$UserCountersDto {
  int get followersCount => throw _privateConstructorUsedError;
  int get followingsCount => throw _privateConstructorUsedError;
  int get notesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCountersDtoCopyWith<UserCountersDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCountersDtoCopyWith<$Res> {
  factory $UserCountersDtoCopyWith(
          UserCountersDto value, $Res Function(UserCountersDto) then) =
      _$UserCountersDtoCopyWithImpl<$Res, UserCountersDto>;
  @useResult
  $Res call({int followersCount, int followingsCount, int notesCount});
}

/// @nodoc
class _$UserCountersDtoCopyWithImpl<$Res, $Val extends UserCountersDto>
    implements $UserCountersDtoCopyWith<$Res> {
  _$UserCountersDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followersCount = null,
    Object? followingsCount = null,
    Object? notesCount = null,
  }) {
    return _then(_value.copyWith(
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingsCount: null == followingsCount
          ? _value.followingsCount
          : followingsCount // ignore: cast_nullable_to_non_nullable
              as int,
      notesCount: null == notesCount
          ? _value.notesCount
          : notesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCountersDtoCopyWith<$Res>
    implements $UserCountersDtoCopyWith<$Res> {
  factory _$$_UserCountersDtoCopyWith(
          _$_UserCountersDto value, $Res Function(_$_UserCountersDto) then) =
      __$$_UserCountersDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int followersCount, int followingsCount, int notesCount});
}

/// @nodoc
class __$$_UserCountersDtoCopyWithImpl<$Res>
    extends _$UserCountersDtoCopyWithImpl<$Res, _$_UserCountersDto>
    implements _$$_UserCountersDtoCopyWith<$Res> {
  __$$_UserCountersDtoCopyWithImpl(
      _$_UserCountersDto _value, $Res Function(_$_UserCountersDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followersCount = null,
    Object? followingsCount = null,
    Object? notesCount = null,
  }) {
    return _then(_$_UserCountersDto(
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingsCount: null == followingsCount
          ? _value.followingsCount
          : followingsCount // ignore: cast_nullable_to_non_nullable
              as int,
      notesCount: null == notesCount
          ? _value.notesCount
          : notesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCountersDto implements _UserCountersDto {
  _$_UserCountersDto(
      {required this.followersCount,
      required this.followingsCount,
      required this.notesCount});

  factory _$_UserCountersDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserCountersDtoFromJson(json);

  @override
  final int followersCount;
  @override
  final int followingsCount;
  @override
  final int notesCount;

  @override
  String toString() {
    return 'UserCountersDto(followersCount: $followersCount, followingsCount: $followingsCount, notesCount: $notesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCountersDto &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingsCount, followingsCount) ||
                other.followingsCount == followingsCount) &&
            (identical(other.notesCount, notesCount) ||
                other.notesCount == notesCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, followersCount, followingsCount, notesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCountersDtoCopyWith<_$_UserCountersDto> get copyWith =>
      __$$_UserCountersDtoCopyWithImpl<_$_UserCountersDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCountersDtoToJson(
      this,
    );
  }
}

abstract class _UserCountersDto implements UserCountersDto {
  factory _UserCountersDto(
      {required final int followersCount,
      required final int followingsCount,
      required final int notesCount}) = _$_UserCountersDto;

  factory _UserCountersDto.fromJson(Map<String, dynamic> json) =
      _$_UserCountersDto.fromJson;

  @override
  int get followersCount;
  @override
  int get followingsCount;
  @override
  int get notesCount;
  @override
  @JsonKey(ignore: true)
  _$$_UserCountersDtoCopyWith<_$_UserCountersDto> get copyWith =>
      throw _privateConstructorUsedError;
}
