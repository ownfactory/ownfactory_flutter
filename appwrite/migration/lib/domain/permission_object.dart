import 'package:json_annotation/json_annotation.dart';

part 'permission_object.g.dart';

@JsonSerializable()
class PermissionObject {
  final List<String> read;
  final List<String> write;

  PermissionObject({
    required this.read,
    required this.write,
  });

  Map<String, dynamic> toJson() => _$PermissionObjectToJson(this);

  factory PermissionObject.fromJson(Map<String, dynamic> json) => _$PermissionObjectFromJson(json);
}
