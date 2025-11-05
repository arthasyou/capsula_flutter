// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    UploadResponse(
      url: json['url'] as String,
      filename: json['filename'] as String,
      size: (json['size'] as num).toInt(),
      mimeType: json['mimeType'] as String?,
    );

Map<String, dynamic> _$UploadResponseToJson(UploadResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'filename': instance.filename,
      'size': instance.size,
      'mimeType': instance.mimeType,
    };
