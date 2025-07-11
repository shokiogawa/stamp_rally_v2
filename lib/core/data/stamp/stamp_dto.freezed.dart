// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stamp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StampDto _$StampDtoFromJson(Map<String, dynamic> json) {
  return _StampDto.fromJson(json);
}

/// @nodoc
mixin _$StampDto {
// スタンプを押したスポットのID
  String get historicSpotId => throw _privateConstructorUsedError;
  String get placeName => throw _privateConstructorUsedError; // スタンプを押した日時のリスト
  List<DateTime> get stampedDateTimeList => throw _privateConstructorUsedError;

  /// Serializes this StampDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StampDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StampDtoCopyWith<StampDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StampDtoCopyWith<$Res> {
  factory $StampDtoCopyWith(StampDto value, $Res Function(StampDto) then) =
      _$StampDtoCopyWithImpl<$Res, StampDto>;
  @useResult
  $Res call(
      {String historicSpotId,
      String placeName,
      List<DateTime> stampedDateTimeList});
}

/// @nodoc
class _$StampDtoCopyWithImpl<$Res, $Val extends StampDto>
    implements $StampDtoCopyWith<$Res> {
  _$StampDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StampDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historicSpotId = null,
    Object? placeName = null,
    Object? stampedDateTimeList = null,
  }) {
    return _then(_value.copyWith(
      historicSpotId: null == historicSpotId
          ? _value.historicSpotId
          : historicSpotId // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      stampedDateTimeList: null == stampedDateTimeList
          ? _value.stampedDateTimeList
          : stampedDateTimeList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StampDtoImplCopyWith<$Res>
    implements $StampDtoCopyWith<$Res> {
  factory _$$StampDtoImplCopyWith(
          _$StampDtoImpl value, $Res Function(_$StampDtoImpl) then) =
      __$$StampDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String historicSpotId,
      String placeName,
      List<DateTime> stampedDateTimeList});
}

/// @nodoc
class __$$StampDtoImplCopyWithImpl<$Res>
    extends _$StampDtoCopyWithImpl<$Res, _$StampDtoImpl>
    implements _$$StampDtoImplCopyWith<$Res> {
  __$$StampDtoImplCopyWithImpl(
      _$StampDtoImpl _value, $Res Function(_$StampDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StampDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historicSpotId = null,
    Object? placeName = null,
    Object? stampedDateTimeList = null,
  }) {
    return _then(_$StampDtoImpl(
      historicSpotId: null == historicSpotId
          ? _value.historicSpotId
          : historicSpotId // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      stampedDateTimeList: null == stampedDateTimeList
          ? _value._stampedDateTimeList
          : stampedDateTimeList // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StampDtoImpl extends _StampDto {
  const _$StampDtoImpl(
      {required this.historicSpotId,
      required this.placeName,
      final List<DateTime> stampedDateTimeList = const []})
      : _stampedDateTimeList = stampedDateTimeList,
        super._();

  factory _$StampDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StampDtoImplFromJson(json);

// スタンプを押したスポットのID
  @override
  final String historicSpotId;
  @override
  final String placeName;
// スタンプを押した日時のリスト
  final List<DateTime> _stampedDateTimeList;
// スタンプを押した日時のリスト
  @override
  @JsonKey()
  List<DateTime> get stampedDateTimeList {
    if (_stampedDateTimeList is EqualUnmodifiableListView)
      return _stampedDateTimeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stampedDateTimeList);
  }

  @override
  String toString() {
    return 'StampDto(historicSpotId: $historicSpotId, placeName: $placeName, stampedDateTimeList: $stampedDateTimeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StampDtoImpl &&
            (identical(other.historicSpotId, historicSpotId) ||
                other.historicSpotId == historicSpotId) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            const DeepCollectionEquality()
                .equals(other._stampedDateTimeList, _stampedDateTimeList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, historicSpotId, placeName,
      const DeepCollectionEquality().hash(_stampedDateTimeList));

  /// Create a copy of StampDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StampDtoImplCopyWith<_$StampDtoImpl> get copyWith =>
      __$$StampDtoImplCopyWithImpl<_$StampDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StampDtoImplToJson(
      this,
    );
  }
}

abstract class _StampDto extends StampDto {
  const factory _StampDto(
      {required final String historicSpotId,
      required final String placeName,
      final List<DateTime> stampedDateTimeList}) = _$StampDtoImpl;
  const _StampDto._() : super._();

  factory _StampDto.fromJson(Map<String, dynamic> json) =
      _$StampDtoImpl.fromJson;

// スタンプを押したスポットのID
  @override
  String get historicSpotId;
  @override
  String get placeName; // スタンプを押した日時のリスト
  @override
  List<DateTime> get stampedDateTimeList;

  /// Create a copy of StampDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StampDtoImplCopyWith<_$StampDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
