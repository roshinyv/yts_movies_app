import 'package:json_annotation/json_annotation.dart';
import 'package:yts_app/domain/search/model/meta.dart';

part 'data.g.dart';

@JsonSerializable()
class SearchData {
  @JsonKey(name: 'movie_count')
  int? movieCount;
  int? limit;
  @JsonKey(name: 'page_number')
  int? pageNumber;
  List<SearchResultMovies>? movies;

  SearchData({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}

@JsonSerializable()
class SearchResults {
  String? status;
  @JsonKey(name: 'status_message')
  String? statusMessage;
  SearchData? data;
  @JsonKey(name: '@meta')
  Meta? meta;

  SearchResults({this.status, this.statusMessage, this.data, this.meta});

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return _$SearchResultsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultsToJson(this);
}

@JsonSerializable()
class SearchResultMovies {
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

  SearchResultMovies({
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

  factory SearchResultMovies.fromJson(Map<String, dynamic> json) =>
      _$SearchResultMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultMoviesToJson(this);
}

@JsonSerializable()
class Torrent {
  String? url;
  String? hash;
  String? quality;
  String? type;
  int? seeds;
  int? peers;
  String? size;
  @JsonKey(name: 'size_bytes')
  int? sizeBytes;
  @JsonKey(name: 'date_uploaded')
  String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  int? dateUploadedUnix;

  Torrent({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return _$TorrentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}
