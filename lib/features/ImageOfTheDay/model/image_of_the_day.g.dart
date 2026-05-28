// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_of_the_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageOfTheDayModel _$ImageOfTheDayModelFromJson(Map<String, dynamic> json) =>
    _ImageOfTheDayModel(
      copyright: json['copyright'] as String?,
      date: json['date'] as String,
      explanation: json['explanation'] as String,
      hdurl: json['hdurl'] as String,
      service_version: json['service_version'] as String,
      media_type: json['media_type'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageOfTheDayModelToJson(_ImageOfTheDayModel instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'service_version': instance.service_version,
      'media_type': instance.media_type,
      'title': instance.title,
      'url': instance.url,
    };
