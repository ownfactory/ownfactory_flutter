import 'package:json_annotation/json_annotation.dart';

part 'file_object.g.dart';

@JsonSerializable()
class FileObject {
  final String $id;
  final Map<String, dynamic> $permissions;
  final String name;
  final int dateCreated;
  final String signature;
  final String mimeType;
  final int sizeOriginal;

  FileObject({
    required this.$id,
    required this.$permissions,
    required this.name,
    required this.dateCreated,
    required this.signature,
    required this.mimeType,
    required this.sizeOriginal,
  });

  Map<String, dynamic> toJson() => _$FileObjectToJson(this);

  factory FileObject.fromJson(Map<String, dynamic> json) => _$FileObjectFromJson(json);
}
