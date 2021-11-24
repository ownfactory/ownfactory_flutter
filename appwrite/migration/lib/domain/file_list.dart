import 'package:json_annotation/json_annotation.dart';
import 'package:migration/domain/file_object.dart';

part 'file_list.g.dart';

@JsonSerializable()
class FileList {
  final int sum;
  final List<FileObject> files;

  FileList({
    required this.sum,
    required this.files,
  });

  Map<String, dynamic> toJson() => _$FileListToJson(this);

  factory FileList.fromJson(Map<String, dynamic> json) => _$FileListFromJson(json);
}
