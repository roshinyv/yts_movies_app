// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Torrent _$TorrentFromJson(Map<String, dynamic> json) => Torrent(
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      quality: json['quality'] as String?,
      type: json['type'] as String?,
      seeds: json['seeds'] as int?,
      peers: json['peers'] as int?,
      size: json['size'] as String?,
      sizeBytes: json['size_bytes'] as int?,
      dateUploaded: json['date_uploaded'] as String?,
      dateUploadedUnix: json['date_uploaded_unix'] as int?,
    );

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'quality': instance.quality,
      'type': instance.type,
      'seeds': instance.seeds,
      'peers': instance.peers,
      'size': instance.size,
      'size_bytes': instance.sizeBytes,
      'date_uploaded': instance.dateUploaded,
      'date_uploaded_unix': instance.dateUploadedUnix,
    };
