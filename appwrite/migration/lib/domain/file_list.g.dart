// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileList _$FileListFromJson(Map<String, dynamic> json) => FileList(
      sum: json['sum'] as int,
      files: (json['files'] as List<dynamic>).map((e) => FileObject.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$FileListToJson(FileList instance) => <String, dynamic>{
      'sum': instance.sum,
      'files': instance.files,
    };
