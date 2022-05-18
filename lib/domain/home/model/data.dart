import 'package:json_annotation/json_annotation.dart';
import 'package:yts_app/domain/home/model/meta.dart';
import 'package:yts_app/domain/home/model/torrent.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'movie_count')
  int? movieCount;
  int? limit;
  @JsonKey(name: 'page_number')
  int? pageNumber;
  List<Movie>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class MovieDatas {
  String? status;
  @JsonKey(name: 'status_message')
  String? statusMessage;
  Data? data;
  @JsonKey(name: '@meta')
  Meta? meta;

  MovieDatas({this.status, this.statusMessage, this.data, this.meta});

  factory MovieDatas.fromJson(Map<String, dynamic> json) {
    return _$MovieDatasFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDatasToJson(this);
}

@JsonSerializable()
class Movie {
  int? id;
  String? url;
  @JsonKey(name: 'imdb_code')
  String? imdbCode;
  String? title;
  @JsonKey(name: 'title_english')
  String? titleEnglish;
  @JsonKey(name: 'title_long')
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  @JsonKey(name: 'description_full')
  String? descriptionFull;
  String? synopsis;
  @JsonKey(name: 'yt_trailer_code')
  String? ytTrailerCode;
  String? language;
  @JsonKey(name: 'mpa_rating')
  String? mpaRating;
  @JsonKey(name: 'background_image')
  String? backgroundImage;
  @JsonKey(name: 'background_image_original')
  String? backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  String? smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  String? mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  String? largeCoverImage;
  String? state;
  List<Torrent>? torrents;
  @JsonKey(name: 'date_uploaded')
  String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  int? dateUploadedUnix;

  Movie({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
