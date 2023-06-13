import 'dart:convert';

List<GetAlbumListResponse> getAlbumListResponseFromJson(String str) => List<GetAlbumListResponse>.from(json.decode(str).map((x) => GetAlbumListResponse.fromJson(x)));

String getAlbumListResponseToJson(List<GetAlbumListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAlbumListResponse {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  GetAlbumListResponse({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory GetAlbumListResponse.fromJson(Map<String, dynamic> json) => GetAlbumListResponse(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
