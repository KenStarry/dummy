import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okoa/features/feature_add_partner/domain/model/okoa_partner.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Message with _$Message{
  @JsonSerializable(explicitToJson: true)
  const factory Message({
    @JsonKey(name: 'message_id') @Default('') String messageId,
    @JsonKey(name: 'message_sender_id') @Default('') String messageSenderId,
    @JsonKey(name: 'message_text') @Default('') String messageText,
    @JsonKey(name: 'message_sent_date') @Default('') String messageSentDate,
    @JsonKey(name: 'is_sender') @Default(true) bool isSender,
    @JsonKey(name: 'is_safe_announcement') @Default(false) bool isSafeAnnouncement,
    @JsonKey(name: 'receiver_ids') @Default(<String>[]) List<String> receiverIds,
}) = _Message;

factory Message.fromJson(Map<String, dynamic> json) =>
_$MessageFromJson(json);
}