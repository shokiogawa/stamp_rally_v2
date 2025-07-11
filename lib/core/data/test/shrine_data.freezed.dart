// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shrine_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShrineData _$ShrineDataFromJson(Map<String, dynamic> json) {
  return _ShrineData.fromJson(json);
}

/// @nodoc
mixin _$ShrineData {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_place')
  int get idPlace => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_name')
  String get areaName => throw _privateConstructorUsedError;
  String get ruby => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_register_stamp')
  TypeRegisterStamp get typeRegisterStamp => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ShrineData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShrineData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShrineDataCopyWith<ShrineData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShrineDataCopyWith<$Res> {
  factory $ShrineDataCopyWith(
          ShrineData value, $Res Function(ShrineData) then) =
      _$ShrineDataCopyWithImpl<$Res, ShrineData>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'id_place') int idPlace,
      String name,
      @JsonKey(name: 'area_name') String areaName,
      String ruby,
      double latitude,
      double longitude,
      @JsonKey(name: 'type_register_stamp') TypeRegisterStamp typeRegisterStamp,
      String url,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$ShrineDataCopyWithImpl<$Res, $Val extends ShrineData>
    implements $ShrineDataCopyWith<$Res> {
  _$ShrineDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShrineData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idPlace = null,
    Object? name = null,
    Object? areaName = null,
    Object? ruby = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? typeRegisterStamp = null,
    Object? url = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idPlace: null == idPlace
          ? _value.idPlace
          : idPlace // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      areaName: null == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String,
      ruby: null == ruby
          ? _value.ruby
          : ruby // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      typeRegisterStamp: null == typeRegisterStamp
          ? _value.typeRegisterStamp
          : typeRegisterStamp // ignore: cast_nullable_to_non_nullable
              as TypeRegisterStamp,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShrineDataImplCopyWith<$Res>
    implements $ShrineDataCopyWith<$Res> {
  factory _$$ShrineDataImplCopyWith(
          _$ShrineDataImpl value, $Res Function(_$ShrineDataImpl) then) =
      __$$ShrineDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'id_place') int idPlace,
      String name,
      @JsonKey(name: 'area_name') String areaName,
      String ruby,
      double latitude,
      double longitude,
      @JsonKey(name: 'type_register_stamp') TypeRegisterStamp typeRegisterStamp,
      String url,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$ShrineDataImplCopyWithImpl<$Res>
    extends _$ShrineDataCopyWithImpl<$Res, _$ShrineDataImpl>
    implements _$$ShrineDataImplCopyWith<$Res> {
  __$$ShrineDataImplCopyWithImpl(
      _$ShrineDataImpl _value, $Res Function(_$ShrineDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShrineData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idPlace = null,
    Object? name = null,
    Object? areaName = null,
    Object? ruby = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? typeRegisterStamp = null,
    Object? url = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ShrineDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idPlace: null == idPlace
          ? _value.idPlace
          : idPlace // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      areaName: null == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String,
      ruby: null == ruby
          ? _value.ruby
          : ruby // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      typeRegisterStamp: null == typeRegisterStamp
          ? _value.typeRegisterStamp
          : typeRegisterStamp // ignore: cast_nullable_to_non_nullable
              as TypeRegisterStamp,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShrineDataImpl extends _ShrineData {
  const _$ShrineDataImpl(
      {required this.id,
      @JsonKey(name: 'id_place') required this.idPlace,
      required this.name,
      @JsonKey(name: 'area_name') required this.areaName,
      required this.ruby,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'type_register_stamp') required this.typeRegisterStamp,
      this.url = '',
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : super._();

  factory _$ShrineDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShrineDataImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'id_place')
  final int idPlace;
  @override
  final String name;
  @override
  @JsonKey(name: 'area_name')
  final String areaName;
  @override
  final String ruby;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'type_register_stamp')
  final TypeRegisterStamp typeRegisterStamp;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ShrineData(id: $id, idPlace: $idPlace, name: $name, areaName: $areaName, ruby: $ruby, latitude: $latitude, longitude: $longitude, typeRegisterStamp: $typeRegisterStamp, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShrineDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idPlace, idPlace) || other.idPlace == idPlace) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName) &&
            (identical(other.ruby, ruby) || other.ruby == ruby) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.typeRegisterStamp, typeRegisterStamp) ||
                other.typeRegisterStamp == typeRegisterStamp) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, idPlace, name, areaName,
      ruby, latitude, longitude, typeRegisterStamp, url, createdAt, updatedAt);

  /// Create a copy of ShrineData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShrineDataImplCopyWith<_$ShrineDataImpl> get copyWith =>
      __$$ShrineDataImplCopyWithImpl<_$ShrineDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShrineDataImplToJson(
      this,
    );
  }
}

abstract class _ShrineData extends ShrineData {
  const factory _ShrineData(
          {required final int id,
          @JsonKey(name: 'id_place') required final int idPlace,
          required final String name,
          @JsonKey(name: 'area_name') required final String areaName,
          required final String ruby,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: 'type_register_stamp')
          required final TypeRegisterStamp typeRegisterStamp,
          final String url,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$ShrineDataImpl;
  const _ShrineData._() : super._();

  factory _ShrineData.fromJson(Map<String, dynamic> json) =
      _$ShrineDataImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'id_place')
  int get idPlace;
  @override
  String get name;
  @override
  @JsonKey(name: 'area_name')
  String get areaName;
  @override
  String get ruby;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'type_register_stamp')
  TypeRegisterStamp get typeRegisterStamp;
  @override
  String get url;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ShrineData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShrineDataImplCopyWith<_$ShrineDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
