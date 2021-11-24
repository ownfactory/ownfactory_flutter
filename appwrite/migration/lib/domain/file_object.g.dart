// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileObject _$FileObjectFromJson(Map<String, dynamic> json) => FileObject(
      $id: json[r'$id'] as String,
      $permissions: json[r'$permissions'] as Map<String, dynamic>,
      name: json['name'] as String,
      dateCreated: json['dateCreated'] as int,
      signature: json['signature'] as String,
      mimeType: json['mimeType'] as String,
      sizeOriginal: json['sizeOriginal'] as int,
    );

Map<String, dynamic> _$FileObjectToJson(FileObject instance) => <String, dynamic>{
      r'$id': instance.$id,
      r'$permissions': instance.$permissions,
      'name': instance.name,
      'dateCreated': instance.dateCreated,
      'signature': instance.signature,
      'mimeType': instance.mimeType,
      'sizeOriginal': instance.sizeOriginal,
    };
