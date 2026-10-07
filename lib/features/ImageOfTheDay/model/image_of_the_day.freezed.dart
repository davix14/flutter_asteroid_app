// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_of_the_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageOfTheDayModel {

 String get date; int get post_id; String get permalink; String get credit; String get copyright; String get explanation; String get alt; String get hdurl; String get media_type; String get title; String get url; String get basic_html; String get basic_html_url;
/// Create a copy of ImageOfTheDayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageOfTheDayModelCopyWith<ImageOfTheDayModel> get copyWith => _$ImageOfTheDayModelCopyWithImpl<ImageOfTheDayModel>(this as ImageOfTheDayModel, _$identity);

  /// Serializes this ImageOfTheDayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageOfTheDayModel&&(identical(other.date, date) || other.date == date)&&(identical(other.post_id, post_id) || other.post_id == post_id)&&(identical(other.permalink, permalink) || other.permalink == permalink)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.hdurl, hdurl) || other.hdurl == hdurl)&&(identical(other.media_type, media_type) || other.media_type == media_type)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.basic_html, basic_html) || other.basic_html == basic_html)&&(identical(other.basic_html_url, basic_html_url) || other.basic_html_url == basic_html_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,post_id,permalink,credit,copyright,explanation,alt,hdurl,media_type,title,url,basic_html,basic_html_url);

@override
String toString() {
  return 'ImageOfTheDayModel(date: $date, post_id: $post_id, permalink: $permalink, credit: $credit, copyright: $copyright, explanation: $explanation, alt: $alt, hdurl: $hdurl, media_type: $media_type, title: $title, url: $url, basic_html: $basic_html, basic_html_url: $basic_html_url)';
}


}

/// @nodoc
abstract mixin class $ImageOfTheDayModelCopyWith<$Res>  {
  factory $ImageOfTheDayModelCopyWith(ImageOfTheDayModel value, $Res Function(ImageOfTheDayModel) _then) = _$ImageOfTheDayModelCopyWithImpl;
@useResult
$Res call({
 String date, int post_id, String permalink, String credit, String copyright, String explanation, String alt, String hdurl, String media_type, String title, String url, String basic_html, String basic_html_url
});




}
/// @nodoc
class _$ImageOfTheDayModelCopyWithImpl<$Res>
    implements $ImageOfTheDayModelCopyWith<$Res> {
  _$ImageOfTheDayModelCopyWithImpl(this._self, this._then);

  final ImageOfTheDayModel _self;
  final $Res Function(ImageOfTheDayModel) _then;

/// Create a copy of ImageOfTheDayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? post_id = null,Object? permalink = null,Object? credit = null,Object? copyright = null,Object? explanation = null,Object? alt = null,Object? hdurl = null,Object? media_type = null,Object? title = null,Object? url = null,Object? basic_html = null,Object? basic_html_url = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,post_id: null == post_id ? _self.post_id : post_id // ignore: cast_nullable_to_non_nullable
as int,permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
as String,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as String,copyright: null == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,hdurl: null == hdurl ? _self.hdurl : hdurl // ignore: cast_nullable_to_non_nullable
as String,media_type: null == media_type ? _self.media_type : media_type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,basic_html: null == basic_html ? _self.basic_html : basic_html // ignore: cast_nullable_to_non_nullable
as String,basic_html_url: null == basic_html_url ? _self.basic_html_url : basic_html_url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageOfTheDayModel].
extension ImageOfTheDayModelPatterns on ImageOfTheDayModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageOfTheDayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageOfTheDayModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageOfTheDayModel value)  $default,){
final _that = this;
switch (_that) {
case _ImageOfTheDayModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageOfTheDayModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImageOfTheDayModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int post_id,  String permalink,  String credit,  String copyright,  String explanation,  String alt,  String hdurl,  String media_type,  String title,  String url,  String basic_html,  String basic_html_url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageOfTheDayModel() when $default != null:
return $default(_that.date,_that.post_id,_that.permalink,_that.credit,_that.copyright,_that.explanation,_that.alt,_that.hdurl,_that.media_type,_that.title,_that.url,_that.basic_html,_that.basic_html_url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int post_id,  String permalink,  String credit,  String copyright,  String explanation,  String alt,  String hdurl,  String media_type,  String title,  String url,  String basic_html,  String basic_html_url)  $default,) {final _that = this;
switch (_that) {
case _ImageOfTheDayModel():
return $default(_that.date,_that.post_id,_that.permalink,_that.credit,_that.copyright,_that.explanation,_that.alt,_that.hdurl,_that.media_type,_that.title,_that.url,_that.basic_html,_that.basic_html_url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int post_id,  String permalink,  String credit,  String copyright,  String explanation,  String alt,  String hdurl,  String media_type,  String title,  String url,  String basic_html,  String basic_html_url)?  $default,) {final _that = this;
switch (_that) {
case _ImageOfTheDayModel() when $default != null:
return $default(_that.date,_that.post_id,_that.permalink,_that.credit,_that.copyright,_that.explanation,_that.alt,_that.hdurl,_that.media_type,_that.title,_that.url,_that.basic_html,_that.basic_html_url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageOfTheDayModel implements ImageOfTheDayModel {
  const _ImageOfTheDayModel({required this.date, required this.post_id, required this.permalink, required this.credit, required this.copyright, required this.explanation, required this.alt, required this.hdurl, required this.media_type, required this.title, required this.url, required this.basic_html, required this.basic_html_url});
  factory _ImageOfTheDayModel.fromJson(Map<String, dynamic> json) => _$ImageOfTheDayModelFromJson(json);

@override final  String date;
@override final  int post_id;
@override final  String permalink;
@override final  String credit;
@override final  String copyright;
@override final  String explanation;
@override final  String alt;
@override final  String hdurl;
@override final  String media_type;
@override final  String title;
@override final  String url;
@override final  String basic_html;
@override final  String basic_html_url;

/// Create a copy of ImageOfTheDayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageOfTheDayModelCopyWith<_ImageOfTheDayModel> get copyWith => __$ImageOfTheDayModelCopyWithImpl<_ImageOfTheDayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageOfTheDayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageOfTheDayModel&&(identical(other.date, date) || other.date == date)&&(identical(other.post_id, post_id) || other.post_id == post_id)&&(identical(other.permalink, permalink) || other.permalink == permalink)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.hdurl, hdurl) || other.hdurl == hdurl)&&(identical(other.media_type, media_type) || other.media_type == media_type)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.basic_html, basic_html) || other.basic_html == basic_html)&&(identical(other.basic_html_url, basic_html_url) || other.basic_html_url == basic_html_url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,post_id,permalink,credit,copyright,explanation,alt,hdurl,media_type,title,url,basic_html,basic_html_url);

@override
String toString() {
  return 'ImageOfTheDayModel(date: $date, post_id: $post_id, permalink: $permalink, credit: $credit, copyright: $copyright, explanation: $explanation, alt: $alt, hdurl: $hdurl, media_type: $media_type, title: $title, url: $url, basic_html: $basic_html, basic_html_url: $basic_html_url)';
}


}

/// @nodoc
abstract mixin class _$ImageOfTheDayModelCopyWith<$Res> implements $ImageOfTheDayModelCopyWith<$Res> {
  factory _$ImageOfTheDayModelCopyWith(_ImageOfTheDayModel value, $Res Function(_ImageOfTheDayModel) _then) = __$ImageOfTheDayModelCopyWithImpl;
@override @useResult
$Res call({
 String date, int post_id, String permalink, String credit, String copyright, String explanation, String alt, String hdurl, String media_type, String title, String url, String basic_html, String basic_html_url
});




}
/// @nodoc
class __$ImageOfTheDayModelCopyWithImpl<$Res>
    implements _$ImageOfTheDayModelCopyWith<$Res> {
  __$ImageOfTheDayModelCopyWithImpl(this._self, this._then);

  final _ImageOfTheDayModel _self;
  final $Res Function(_ImageOfTheDayModel) _then;

/// Create a copy of ImageOfTheDayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? post_id = null,Object? permalink = null,Object? credit = null,Object? copyright = null,Object? explanation = null,Object? alt = null,Object? hdurl = null,Object? media_type = null,Object? title = null,Object? url = null,Object? basic_html = null,Object? basic_html_url = null,}) {
  return _then(_ImageOfTheDayModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,post_id: null == post_id ? _self.post_id : post_id // ignore: cast_nullable_to_non_nullable
as int,permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
as String,credit: null == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as String,copyright: null == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,hdurl: null == hdurl ? _self.hdurl : hdurl // ignore: cast_nullable_to_non_nullable
as String,media_type: null == media_type ? _self.media_type : media_type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,basic_html: null == basic_html ? _self.basic_html : basic_html // ignore: cast_nullable_to_non_nullable
as String,basic_html_url: null == basic_html_url ? _self.basic_html_url : basic_html_url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
