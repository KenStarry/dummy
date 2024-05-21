// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      messageId: json['message_id'] as String? ?? '',
      messageSenderId: json['message_sender_id'] as String? ?? '',
      messageText: json['message_text'] as String? ?? '',
      messageSentDate: json['message_sent_date'] as String? ?? '',
      isSender: json['is_sender'] as bool? ?? true,
      isSafeAnnouncement: json['is_safe_announcement'] as bool? ?? false,
      receiverIds: (json['receiver_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'message_sender_id': instance.messageSenderId,
      'message_text': instance.messageText,
      'message_sent_date': instance.messageSentDate,
      'is_sender': instance.isSender,
      'is_safe_announcement': instance.isSafeAnnouncement,
      'receiver_ids': instance.receiverIds,
    };
