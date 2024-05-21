// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'okoa_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OkoaUser _$OkoaUserFromJson(Map<String, dynamic> json) {
  return _OkoaUser.fromJson(json);
}

/// @nodoc
mixin _$OkoaUser {
  @JsonKey(name: 'id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_address')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcm_token')
  String get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_requests')
  List<OkoaPartner> get sentRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_requests')
  List<OkoaPartner> get receivedRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'partners')
  List<String> get partners => throw _privateConstructorUsedError;
  @JsonKey(name: 'sos')
  SOS get sos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OkoaUserCopyWith<OkoaUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OkoaUserCopyWith<$Res> {
  factory $OkoaUserCopyWith(OkoaUser value, $Res Function(OkoaUser) then) =
      _$OkoaUserCopyWithImpl<$Res, OkoaUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String userId,
      @JsonKey(name: 'email_address') String email,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'username') String userName,
      @JsonKey(name: 'phone_number') String phone,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'latitude') String latitude,
      @JsonKey(name: 'longitude') String longitude,
      @JsonKey(name: 'fcm_token') String fcmToken,
      @JsonKey(name: 'sent_requests') List<OkoaPartner> sentRequests,
      @JsonKey(name: 'received_requests') List<OkoaPartner> receivedRequests,
      @JsonKey(name: 'partners') List<String> partners,
      @JsonKey(name: 'sos') SOS sos});

  $SOSCopyWith<$Res> get sos;
}

/// @nodoc
class _$OkoaUserCopyWithImpl<$Res, $Val extends OkoaUser>
    implements $OkoaUserCopyWith<$Res> {
  _$OkoaUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? createdAt = null,
    Object? userName = null,
    Object? phone = null,
    Object? avatarUrl = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? fcmToken = null,
    Object? sentRequests = null,
    Object? receivedRequests = null,
    Object? partners = null,
    Object? sos = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      sentRequests: null == sentRequests
          ? _value.sentRequests
          : sentRequests // ignore: cast_nullable_to_non_nullable
              as List<OkoaPartner>,
      receivedRequests: null == receivedRequests
          ? _value.receivedRequests
          : receivedRequests // ignore: cast_nullable_to_non_nullable
              as List<OkoaPartner>,
      partners: null == partners
          ? _value.partners
          : partners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sos: null == sos
          ? _value.sos
          : sos // ignore: cast_nullable_to_non_nullable
              as SOS,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SOSCopyWith<$Res> get sos {
    return $SOSCopyWith<$Res>(_value.sos, (value) {
      return _then(_value.copyWith(sos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OkoaUserImplCopyWith<$Res>
    implements $OkoaUserCopyWith<$Res> {
  factory _$$OkoaUserImplCopyWith(
          _$OkoaUserImpl value, $Res Function(_$OkoaUserImpl) then) =
      __$$OkoaUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String userId,
      @JsonKey(name: 'email_address') String email,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'username') String userName,
      @JsonKey(name: 'phone_number') String phone,
      @JsonKey(name: 'avatar_url') String avatarUrl,
      @JsonKey(name: 'latitude') String latitude,
      @JsonKey(name: 'longitude') String longitude,
      @JsonKey(name: 'fcm_token') String fcmToken,
      @JsonKey(name: 'sent_requests') List<OkoaPartner> sentRequests,
      @JsonKey(name: 'received_requests') List<OkoaPartner> receivedRequests,
      @JsonKey(name: 'partners') List<String> partners,
      @JsonKey(name: 'sos') SOS sos});

  @override
  $SOSCopyWith<$Res> get sos;
}

/// @nodoc
class __$$OkoaUserImplCopyWithImpl<$Res>
    extends _$OkoaUserCopyWithImpl<$Res, _$OkoaUserImpl>
    implements _$$OkoaUserImplCopyWith<$Res> {
  __$$OkoaUserImplCopyWithImpl(
      _$OkoaUserImpl _value, $Res Function(_$OkoaUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? email = null,
    Object? createdAt = null,
    Object? userName = null,
    Object? phone = null,
    Object? avatarUrl = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? fcmToken = null,
    Object? sentRequests = null,
    Object? receivedRequests = null,
    Object? partners = null,
    Object? sos = null,
  }) {
    return _then(_$OkoaUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      sentRequests: null == sentRequests
          ? _value._sentRequests
          : sentRequests // ignore: cast_nullable_to_non_nullable
              as List<OkoaPartner>,
      receivedRequests: null == receivedRequests
          ? _value._receivedRequests
          : receivedRequests // ignore: cast_nullable_to_non_nullable
              as List<OkoaPartner>,
      partners: null == partners
          ? _value._partners
          : partners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sos: null == sos
          ? _value.sos
          : sos // ignore: cast_nullable_to_non_nullable
              as SOS,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OkoaUserImpl implements _OkoaUser {
  const _$OkoaUserImpl(
      {@JsonKey(name: 'id') this.userId = '',
      @JsonKey(name: 'email_address') this.email = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'username') this.userName = '',
      @JsonKey(name: 'phone_number') this.phone = '',
      @JsonKey(name: 'avatar_url') this.avatarUrl = '',
      @JsonKey(name: 'latitude') this.latitude = '',
      @JsonKey(name: 'longitude') this.longitude = '',
      @JsonKey(name: 'fcm_token') this.fcmToken = '',
      @JsonKey(name: 'sent_requests')
      final List<OkoaPartner> sentRequests = const [],
      @JsonKey(name: 'received_requests')
      final List<OkoaPartner> receivedRequests = const [],
      @JsonKey(name: 'partners') final List<String> partners = const [],
      @JsonKey(name: 'sos')
      this.sos = const SOS(sosState: 'SosState.safe', sosDate: '2024-01-28')})
      : _sentRequests = sentRequests,
        _receivedRequests = receivedRequests,
        _partners = partners;

  factory _$OkoaUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$OkoaUserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String userId;
  @override
  @JsonKey(name: 'email_address')
  final String email;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'username')
  final String userName;
  @override
  @JsonKey(name: 'phone_number')
  final String phone;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @override
  @JsonKey(name: 'latitude')
  final String latitude;
  @override
  @JsonKey(name: 'longitude')
  final String longitude;
  @override
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  final List<OkoaPartner> _sentRequests;
  @override
  @JsonKey(name: 'sent_requests')
  List<OkoaPartner> get sentRequests {
    if (_sentRequests is EqualUnmodifiableListView) return _sentRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentRequests);
  }

  final List<OkoaPartner> _receivedRequests;
  @override
  @JsonKey(name: 'received_requests')
  List<OkoaPartner> get receivedRequests {
    if (_receivedRequests is EqualUnmodifiableListView)
      return _receivedRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receivedRequests);
  }

  final List<String> _partners;
  @override
  @JsonKey(name: 'partners')
  List<String> get partners {
    if (_partners is EqualUnmodifiableListView) return _partners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partners);
  }

  @override
  @JsonKey(name: 'sos')
  final SOS sos;

  @override
  String toString() {
    return 'OkoaUser(userId: $userId, email: $email, createdAt: $createdAt, userName: $userName, phone: $phone, avatarUrl: $avatarUrl, latitude: $latitude, longitude: $longitude, fcmToken: $fcmToken, sentRequests: $sentRequests, receivedRequests: $receivedRequests, partners: $partners, sos: $sos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OkoaUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            const DeepCollectionEquality()
                .equals(other._sentRequests, _sentRequests) &&
            const DeepCollectionEquality()
                .equals(other._receivedRequests, _receivedRequests) &&
            const DeepCollectionEquality().equals(other._partners, _partners) &&
            (identical(other.sos, sos) || other.sos == sos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      email,
      createdAt,
      userName,
      phone,
      avatarUrl,
      latitude,
      longitude,
      fcmToken,
      const DeepCollectionEquality().hash(_sentRequests),
      const DeepCollectionEquality().hash(_receivedRequests),
      const DeepCollectionEquality().hash(_partners),
      sos);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OkoaUserImplCopyWith<_$OkoaUserImpl> get copyWith =>
      __$$OkoaUserImplCopyWithImpl<_$OkoaUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OkoaUserImplToJson(
      this,
    );
  }
}

abstract class _OkoaUser implements OkoaUser {
  const factory _OkoaUser(
      {@JsonKey(name: 'id') final String userId,
      @JsonKey(name: 'email_address') final String email,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'username') final String userName,
      @JsonKey(name: 'phone_number') final String phone,
      @JsonKey(name: 'avatar_url') final String avatarUrl,
      @JsonKey(name: 'latitude') final String latitude,
      @JsonKey(name: 'longitude') final String longitude,
      @JsonKey(name: 'fcm_token') final String fcmToken,
      @JsonKey(name: 'sent_requests') final List<OkoaPartner> sentRequests,
      @JsonKey(name: 'received_requests')
      final List<OkoaPartner> receivedRequests,
      @JsonKey(name: 'partners') final List<String> partners,
      @JsonKey(name: 'sos') final SOS sos}) = _$OkoaUserImpl;

  factory _OkoaUser.fromJson(Map<String, dynamic> json) =
      _$OkoaUserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get userId;
  @override
  @JsonKey(name: 'email_address')
  String get email;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'username')
  String get userName;
  @override
  @JsonKey(name: 'phone_number')
  String get phone;
  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;
  @override
  @JsonKey(name: 'latitude')
  String get latitude;
  @override
  @JsonKey(name: 'longitude')
  String get longitude;
  @override
  @JsonKey(name: 'fcm_token')
  String get fcmToken;
  @override
  @JsonKey(name: 'sent_requests')
  List<OkoaPartner> get sentRequests;
  @override
  @JsonKey(name: 'received_requests')
  List<OkoaPartner> get receivedRequests;
  @override
  @JsonKey(name: 'partners')
  List<String> get partners;
  @override
  @JsonKey(name: 'sos')
  SOS get sos;
  @override
  @JsonKey(ignore: true)
  _$$OkoaUserImplCopyWith<_$OkoaUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
