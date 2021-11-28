import 'package:json_annotation/json_annotation.dart';

part 'metadata_collection.g.dart';

@JsonSerializable()
class MetadataCollection {
  final String id;
  final String name;

  MetadataCollection({
    required this.id,
    required this.name,
  });

  factory MetadataCollection.fromJson(Map<String, dynamic> json) => _$MetadataCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataCollectionToJson(this);
}
