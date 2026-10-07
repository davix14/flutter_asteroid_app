// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_of_the_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageOfTheDayModel _$ImageOfTheDayModelFromJson(Map<String, dynamic> json) =>
    _ImageOfTheDayModel(
      date: json['date'] as String,
      post_id: (json['post_id'] as num).toInt(),
      permalink: json['permalink'] as String,
      credit: json['credit'] as String,
      copyright: json['copyright'] as String,
      explanation: json['explanation'] as String,
      alt: json['alt'] as String,
      hdurl: json['hdurl'] as String,
      media_type: json['media_type'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      basic_html: json['basic_html'] as String,
      basic_html_url: json['basic_html_url'] as String,
    );

Map<String, dynamic> _$ImageOfTheDayModelToJson(_ImageOfTheDayModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'post_id': instance.post_id,
      'permalink': instance.permalink,
      'credit': instance.credit,
      'copyright': instance.copyright,
      'explanation': instance.explanation,
      'alt': instance.alt,
      'hdurl': instance.hdurl,
      'media_type': instance.media_type,
      'title': instance.title,
      'url': instance.url,
      'basic_html': instance.basic_html,
      'basic_html_url': instance.basic_html_url,
    };
