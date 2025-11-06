// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthTag _$HealthTagFromJson(Map<String, dynamic> json) => HealthTag(
  id: json['id'] as String,
  name: json['name'] as String,
  color: json['color'] as String?,
);

Map<String, dynamic> _$HealthTagToJson(HealthTag instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
};

HealthDataRecord _$HealthDataRecordFromJson(Map<String, dynamic> json) =>
    HealthDataRecord(
      id: json['id'] as String,
      type: $enumDecode(_$HealthDataTypeEnumMap, json['type']),
      content: json['content'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      source: $enumDecode(_$DataSourceEnumMap, json['source']),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => HealthTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$HealthDataRecordToJson(HealthDataRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$HealthDataTypeEnumMap[instance.type]!,
      'content': instance.content,
      'dateTime': instance.dateTime.toIso8601String(),
      'source': _$DataSourceEnumMap[instance.source]!,
      'tags': instance.tags,
      'notes': instance.notes,
      'metadata': instance.metadata,
    };

const _$HealthDataTypeEnumMap = {
  HealthDataType.bloodPressure: 'blood_pressure',
  HealthDataType.bloodSugar: 'blood_sugar',
  HealthDataType.heartRate: 'heart_rate',
  HealthDataType.checkup: 'checkup',
  HealthDataType.medication: 'medication',
  HealthDataType.other: 'other',
};

const _$DataSourceEnumMap = {
  DataSource.camera: 'camera',
  DataSource.upload: 'upload',
  DataSource.manual: 'manual',
  DataSource.device: 'device',
  DataSource.voice: 'voice',
};
