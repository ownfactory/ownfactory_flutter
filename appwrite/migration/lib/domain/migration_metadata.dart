import 'package:json_annotation/json_annotation.dart';

part 'migration_metadata.g.dart';

@JsonSerializable()
class MigrationMetadata {
  final int version;

  MigrationMetadata({
    required this.version,
  });

  Map<String, dynamic> toJson() => _$MigrationMetadataToJson(this);

  factory MigrationMetadata.fromJson(Map<String, dynamic> json) => _$MigrationMetadataFromJson(json);
}
