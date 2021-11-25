// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionObject _$PermissionObjectFromJson(Map<String, dynamic> json) => PermissionObject(
      read: (json['read'] as List<dynamic>).map((e) => e as String).toList(),
      write: (json['write'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PermissionObjectToJson(PermissionObject instance) => <String, dynamic>{
      'read': instance.read,
      'write': instance.write,
    };
