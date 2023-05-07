// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  double averageRating;
  String backdropPath;
  Map<String, String?> comments;
  CreatedBy createdBy;
  String description;
  int id;
  String iso31661;
  Iso6391 iso6391;
  String name;
  Map<String, String?> objectIds;
  int page;
  String posterPath;
  bool public;
  List<Result> results;
  int revenue;
  int runtime;
  String sortBy;
  int totalPages;
  int totalResults;

  Movie({
    required this.averageRating,
    required this.backdropPath,
    required this.comments,
    required this.createdBy,
    required this.description,
    required this.id,
    required this.iso31661,
    required this.iso6391,
    required this.name,
    required this.objectIds,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.results,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        averageRating: json["average_rating"]?.toDouble(),
        backdropPath: json["backdrop_path"],
        comments: Map.from(json["comments"])
            .map((k, v) => MapEntry<String, String?>(k, v)),
        createdBy: CreatedBy.fromJson(json["created_by"]),
        description: json["description"],
        id: json["id"],
        iso31661: json["iso_3166_1"],
        iso6391: iso6391Values.map[json["iso_639_1"]]!,
        name: json["name"],
        objectIds: Map.from(json["object_ids"])
            .map((k, v) => MapEntry<String, String?>(k, v)),
        page: json["page"],
        posterPath: json["poster_path"],
        public: json["public"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        revenue: json["revenue"],
        runtime: json["runtime"],
        sortBy: json["sort_by"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "backdrop_path": backdropPath,
        "comments":
            Map.from(comments).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "created_by": createdBy.toJson(),
        "description": description,
        "id": id,
        "iso_3166_1": iso31661,
        "iso_639_1": iso6391Values.reverse[iso6391],
        "name": name,
        "object_ids":
            Map.from(objectIds).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "page": page,
        "poster_path": posterPath,
        "public": public,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "revenue": revenue,
        "runtime": runtime,
        "sort_by": sortBy,
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class CreatedBy {
  String gravatarHash;
  String id;
  String name;
  String username;

  CreatedBy({
    required this.gravatarHash,
    required this.id,
    required this.name,
    required this.username,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        gravatarHash: json["gravatar_hash"],
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "gravatar_hash": gravatarHash,
        "id": id,
        "name": name,
        "username": username,
      };
}

enum Iso6391 { EN }

final iso6391Values = EnumValues({"en": Iso6391.EN});

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  MediaType mediaType;
  Iso6391 originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        originalLanguage: iso6391Values.map[json["original_language"]]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "original_language": iso6391Values.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
