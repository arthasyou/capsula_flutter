import 'package:json_annotation/json_annotation.dart';

part 'upload_response.g.dart';

@JsonSerializable()
class UploadResponse {
  final String url;
  final String filename;
  final int size;
  final String? mimeType;

  const UploadResponse({
    required this.url,
    required this.filename,
    required this.size,
    this.mimeType,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}
