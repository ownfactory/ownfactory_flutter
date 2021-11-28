import 'package:json_annotation/json_annotation.dart';
import 'package:migration/domain/rule_validation_type.dart';

part 'collection_rule.g.dart';

@JsonSerializable()
class CollectionRule {
  @JsonKey(name: '\$id')
  final String? id;
  @JsonKey(name: '\$collection')
  final String collection;
  final RuleValidationType type;
  final String key;
  final String label;
  @JsonKey(name: 'default')
  final dynamic defaultValue;
  final bool array;
  final bool required;
  final List<String> list;

  CollectionRule({
    this.id,
    required this.required,
    required this.collection,
    required this.label,
    required this.type,
    required this.array,
    required this.defaultValue,
    required this.key,
    required this.list,
  });

  Map<String, dynamic> toJson() => _$CollectionRuleToJson(this);

  factory CollectionRule.fromJson(Map<String, dynamic> json) => _$CollectionRuleFromJson(json);
}
