import 'package:freezed_annotation/freezed_annotation.dart';

part 'ImageOfTheDayModel.freezed.dart';
part 'ImageOfTheDayModel.g.dart';

@freezed
class ImageOfTheDayModel with _$ImageOfTheDayModel {
  @JsonSerializable(explicitToJson: true)
  const factory ImageOfTheDayModel({
    String? copyright,
    required String date,
    required String explanation,
    required String hdurl,
    required String service_version,
    required String media_type,
    required String title,
    required String url,
  }) = _ImageOfTheDayModel;

  factory ImageOfTheDayModel.fromJson(Map<String, Object?> json) =>
      _$ImageOfTheDayModelFromJson(json);
}

/*
{
    "date": "2023-03-03",
    "explanation": "In 185 AD, Chinese astronomers recorded the appearance of a new star in the Nanmen asterism. That part of the sky is identified with Alpha and Beta Centauri on modern star charts. The new star was visible to the naked-eye for months, and is now thought to be the earliest recorded supernova. This deep telescopic view reveals the wispy outlines of emission nebula RCW 86, just visible against the starry background, understood to be the remnant of that stellar explosion. Captured by the wide-field Dark Energy Camera operating at Cerro Tololo Inter-American Observatory in Chile, the image traces the full extent of a ragged shell of gas ionized by the still expanding shock wave. Space-based images indicate an abundance of the element iron in RCW 86 and the absence of a neutron star or pulsar within the remnant, suggesting that the original supernova was Type Ia. Unlike the core collapse supernova explosion of a massive star, a Type Ia supernova is a thermonuclear detonation on a white dwarf star that accretes material from a companion in a binary star system. Near the plane of our Milky Way galaxy and larger than the full moon on the sky this supernova remnant is too faint to be seen by eye though. RCW 86 is some 8,000 light-years distant and around 100 light-years across.",
    "hdurl": "https://apod.nasa.gov/apod/image/2303/noirlab2307a2048c.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "RCW 86: Historical Supernova Remnant",
    "url": "https://apod.nasa.gov/apod/image/2303/noirlab2307a1024c.jpg"
}
 */

/*
"copyright": "Mike Selby",
	"date": "2023-03-02",
	"explanation": "Spiral galaxy NGC 3169 looks to be unraveling like a ball of cosmic yarn. It lies some 70 million light-years away, south of bright star Regulus toward the faint constellation Sextans. Wound up spiral arms are pulled out into sweeping tidal tails as NGC 3169 (left) and neighboring NGC 3166 interact gravitationally. Eventually the galaxies will merge into one, a common fate even for bright galaxies in the local universe. Drawn out stellar arcs and plumes are clear indications of the ongoing gravitational interactions across the deep and colorful galaxy group photo. The telescopic frame spans about 20 arc minutes or about 400,000 light-years at the group's estimated distance, and includes smaller, bluish NGC 3165 at the right. NGC 3169 is also known to shine across the spectrum from radio to X-rays, harboring an active galactic nucleus that is the site of a supermassive black hole.",
	"hdurl": "https://apod.nasa.gov/apod/image/2303/NGC3169LRGBrevFinalcropCDK1000_27Feb2023_2048.jpg",
	"media_type": "image",
	"service_version": "v1",
	"title": "Unraveling NGC 3169",
	"url": "https://apod.nasa.gov/apod/image/2303/NGC3169LRGBrevFinalcropCDK1000_27Feb2023_1024.jpg"
}
 */