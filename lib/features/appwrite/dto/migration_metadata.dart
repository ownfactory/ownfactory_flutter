import 'package:json_annotation/json_annotation.dart';
import 'package:ownfactory_flutter/features/appwrite/dto/metadata_collection.dart';

part 'migration_metadata.g.dart';

@JsonSerializable()
class MigrationMetadata {
  final int version;
  final List<MetadataCollection> collections;

  MigrationMetadata({
    required this.version,
    required this.collections,
  });

  factory MigrationMetadata.fromJson(Map<String, dynamic> json) => _$MigrationMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MigrationMetadataToJson(this);

  MigrationMetadata copyWith({
    int? version,
    List<MetadataCollection>? collections,
  }) =>
      MigrationMetadata(
        version: version ?? this.version,
        collections: collections ?? this.collections,
      );
}
