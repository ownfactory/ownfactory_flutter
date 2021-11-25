import 'package:json_annotation/json_annotation.dart';
import 'package:migration/domain/permission_object.dart';

part 'collection_object.g.dart';

@JsonSerializable()
class CollectionObject {
  @JsonKey(name: '\$id')
  final String? id;
  final String name;
  @JsonKey(name: '\$permissions')
  final PermissionObject permissions;

  CollectionObject({
    this.id,
    required this.name,
    required this.permissions,
  });

  Map<String, dynamic> toJson() => _$CollectionObjectToJson(this);

  factory CollectionObject.fromJson(Map<String, dynamic> json) => _$CollectionObjectFromJson(json);
}
