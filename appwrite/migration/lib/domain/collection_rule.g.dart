// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionRule _$CollectionRuleFromJson(Map<String, dynamic> json) => CollectionRule(
      id: json[r'$id'] as String?,
      required: json['required'] as bool,
      collection: json[r'$collection'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$RuleValidationTypeEnumMap, json['type']),
      array: json['array'] as bool,
      defaultValue: json['default'],
      key: json['key'] as String,
      list: (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CollectionRuleToJson(CollectionRule instance) => <String, dynamic>{
      r'$id': instance.id,
      r'$collection': instance.collection,
      'type': _$RuleValidationTypeEnumMap[instance.type],
      'key': instance.key,
      'label': instance.label,
      'default': instance.defaultValue,
      'array': instance.array,
      'required': instance.required,
      'list': instance.list,
    };

const _$RuleValidationTypeEnumMap = {
  RuleValidationType.text: 'text',
  RuleValidationType.numeric: 'numeric',
  RuleValidationType.boolean: 'boolean',
  RuleValidationType.wildcard: 'wildcard',
  RuleValidationType.url: 'url',
  RuleValidationType.email: 'email',
  RuleValidationType.ip: 'ip',
  RuleValidationType.document: 'document',
};
