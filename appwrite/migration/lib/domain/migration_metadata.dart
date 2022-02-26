import 'package:json_annotation/json_annotation.dart';
import 'package:migration/domain/metadata_collection.dart';

part 'migration_metadata.g.dart';

@JsonSerializable()
class MigrationMetadata {
  final int version;
  final List<MetadataCollection> collections;

  MigrationMetadata({
    required this.version,
    required this.collections,
  });

  MigrationMetadata copyWith({
    int? version,
    List<MetadataCollection>? collections,
  }) =>
      MigrationMetadata(
        version: version ?? this.version,
        collections: collections ?? this.collections,
      );

  Map<String, dynamic> toJson() => _$MigrationMetadataToJson(this);

  factory MigrationMetadata.fromJson(Map<String, dynamic> json) => _$MigrationMetadataFromJson(json);
}
