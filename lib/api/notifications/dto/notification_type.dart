import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum NotificationType {
  follow,
  followRequest,
}