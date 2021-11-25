import 'package:json_annotation/json_annotation.dart';

part 'migration_metadata.g.dart';

@JsonSerializable()
class MigrationMetadata {
  final int version;
  final List<String> collections;

  MigrationMetadata({
    required this.version,
    this.collections = const [],
  });

  MigrationMetadata copyWith({
    int? version,
    List<String>? collections,
  }) =>
      MigrationMetadata(
        version: version ?? this.version,
        collections: collections ?? this.collections,
      );

  Map<String, dynamic> toJson() => _$MigrationMetadataToJson(this);

  factory MigrationMetadata.fromJson(Map<String, dynamic> json) => _$MigrationMetadataFromJson(json);
}
