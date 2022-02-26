// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MigrationMetadata _$MigrationMetadataFromJson(Map<String, dynamic> json) => MigrationMetadata(
      version: json['version'] as int,
      collections: (json['collections'] as List<dynamic>?)
              ?.map((e) => MetadataCollection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MigrationMetadataToJson(MigrationMetadata instance) => <String, dynamic>{
      'version': instance.version,
      'collections': instance.collections,
    };
