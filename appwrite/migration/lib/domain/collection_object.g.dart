// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionObject _$CollectionObjectFromJson(Map<String, dynamic> json) => CollectionObject(
      id: json[r'$id'] as String?,
      name: json['name'] as String,
      permissions: PermissionObject.fromJson(json[r'$permissions'] as Map<String, dynamic>),
      rules: (json['rules'] as List<dynamic>).map((e) => CollectionRule.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$CollectionObjectToJson(CollectionObject instance) => <String, dynamic>{
      r'$id': instance.id,
      'name': instance.name,
      r'$permissions': instance.permissions,
      'rules': instance.rules,
    };
