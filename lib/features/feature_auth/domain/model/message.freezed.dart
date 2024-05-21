// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  @JsonKey(name: 'message_id')
  String get messageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_sender_id')
  String get messageSenderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_text')
  String get messageText => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_sent_date')
  String get messageSentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_sender')
  bool get isSender => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_safe_announcement')
  bool get isSafeAnnouncement => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_ids')
  List<String> get receiverIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message_id') String messageId,
      @JsonKey(name: 'message_sender_id') String messageSenderId,
      @JsonKey(name: 'message_text') String messageText,
      @JsonKey(name: 'message_sent_date') String messageSentDate,
      @JsonKey(name: 'is_sender') bool isSender,
      @JsonKey(name: 'is_safe_announcement') bool isSafeAnnouncement,
      @JsonKey(name: 'receiver_ids') List<String> receiverIds});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? messageSenderId = null,
    Object? messageText = null,
    Object? messageSentDate = null,
    Object? isSender = null,
    Object? isSafeAnnouncement = null,
    Object? receiverIds = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      messageSenderId: null == messageSenderId
          ? _value.messageSenderId
          : messageSenderId // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: null == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
      messageSentDate: null == messageSentDate
          ? _value.messageSentDate
          : messageSentDate // ignore: cast_nullable_to_non_nullable
              as String,
      isSender: null == isSender
          ? _value.isSender
          : isSender // ignore: cast_nullable_to_non_nullable
              as bool,
      isSafeAnnouncement: null == isSafeAnnouncement
          ? _value.isSafeAnnouncement
          : isSafeAnnouncement // ignore: cast_nullable_to_non_nullable
              as bool,
      receiverIds: null == receiverIds
          ? _value.receiverIds
          : receiverIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message_id') String messageId,
      @JsonKey(name: 'message_sender_id') String messageSenderId,
      @JsonKey(name: 'message_text') String messageText,
      @JsonKey(name: 'message_sent_date') String messageSentDate,
      @JsonKey(name: 'is_sender') bool isSender,
      @JsonKey(name: 'is_safe_announcement') bool isSafeAnnouncement,
      @JsonKey(name: 'receiver_ids') List<String> receiverIds});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? messageSenderId = null,
    Object? messageText = null,
    Object? messageSentDate = null,
    Object? isSender = null,
    Object? isSafeAnnouncement = null,
    Object? receiverIds = null,
  }) {
    return _then(_$MessageImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      messageSenderId: null == messageSenderId
          ? _value.messageSenderId
          : messageSenderId // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: null == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
      messageSentDate: null == messageSentDate
          ? _value.messageSentDate
          : messageSentDate // ignore: cast_nullable_to_non_nullable
              as String,
      isSender: null == isSender
          ? _value.isSender
          : isSender // ignore: cast_nullable_to_non_nullable
              as bool,
      isSafeAnnouncement: null == isSafeAnnouncement
          ? _value.isSafeAnnouncement
          : isSafeAnnouncement // ignore: cast_nullable_to_non_nullable
              as bool,
      receiverIds: null == receiverIds
          ? _value.receiverIds
          : receiverIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {@JsonKey(name: 'message_id') this.messageId = '',
      @JsonKey(name: 'message_sender_id') this.messageSenderId = '',
      @JsonKey(name: 'message_text') this.messageText = '',
      @JsonKey(name: 'message_sent_date') this.messageSentDate = '',
      @JsonKey(name: 'is_sender') this.isSender = true,
      @JsonKey(name: 'is_safe_announcement') this.isSafeAnnouncement = false,
      @JsonKey(name: 'receiver_ids') this.receiverIds = const <String>[]});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  @JsonKey(name: 'message_id')
  final String messageId;
  @override
  @JsonKey(name: 'message_sender_id')
  final String messageSenderId;
  @override
  @JsonKey(name: 'message_text')
  final String messageText;
  @override
  @JsonKey(name: 'message_sent_date')
  final String messageSentDate;
  @override
  @JsonKey(name: 'is_sender')
  final bool isSender;
  @override
  @JsonKey(name: 'is_safe_announcement')
  final bool isSafeAnnouncement;
  @override
  @JsonKey(name: 'receiver_ids')
  final List<String> receiverIds;

  @override
  String toString() {
    return 'Message(messageId: $messageId, messageSenderId: $messageSenderId, messageText: $messageText, messageSentDate: $messageSentDate, isSender: $isSender, isSafeAnnouncement: $isSafeAnnouncement, receiverIds: $receiverIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.messageSenderId, messageSenderId) ||
                other.messageSenderId == messageSenderId) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.messageSentDate, messageSentDate) ||
                other.messageSentDate == messageSentDate) &&
            (identical(other.isSender, isSender) ||
                other.isSender == isSender) &&
            (identical(other.isSafeAnnouncement, isSafeAnnouncement) ||
                other.isSafeAnnouncement == isSafeAnnouncement) &&
            const DeepCollectionEquality()
                .equals(other.receiverIds, receiverIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageId,
      messageSenderId,
      messageText,
      messageSentDate,
      isSender,
      isSafeAnnouncement,
      const DeepCollectionEquality().hash(receiverIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
          {@JsonKey(name: 'message_id') final String messageId,
          @JsonKey(name: 'message_sender_id') final String messageSenderId,
          @JsonKey(name: 'message_text') final String messageText,
          @JsonKey(name: 'message_sent_date') final String messageSentDate,
          @JsonKey(name: 'is_sender') final bool isSender,
          @JsonKey(name: 'is_safe_announcement') final bool isSafeAnnouncement,
          @JsonKey(name: 'receiver_ids') final List<String> receiverIds}) =
      _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  @JsonKey(name: 'message_id')
  String get messageId;
  @override
  @JsonKey(name: 'message_sender_id')
  String get messageSenderId;
  @override
  @JsonKey(name: 'message_text')
  String get messageText;
  @override
  @JsonKey(name: 'message_sent_date')
  String get messageSentDate;
  @override
  @JsonKey(name: 'is_sender')
  bool get isSender;
  @override
  @JsonKey(name: 'is_safe_announcement')
  bool get isSafeAnnouncement;
  @override
  @JsonKey(name: 'receiver_ids')
  List<String> get receiverIds;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
