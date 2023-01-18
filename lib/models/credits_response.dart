// To parse this JSON data, do
//
//     final creditResponse = creditResponseFromMap(jsonString);

import 'dart:convert';

class CreditResponse {
    CreditResponse({
        this.id,
        this.cast,
        this.crew,
    });

    int? id;
    List<Cast?>? cast;
    List<Cast?>? crew;

    factory CreditResponse.fromJson(String str) => CreditResponse.fromMap(json.decode(str));

    factory CreditResponse.fromMap(Map<String, dynamic> json) => CreditResponse(
        id: json["id"],
        cast: json["cast"] == null ? [] : List<Cast?>.from(json["cast"]!.map((x) => Cast.fromMap(x))),
        crew: json["crew"] == null ? [] : List<Cast?>.from(json["crew"]!.map((x) => Cast.fromMap(x))),
    );

}

class Cast {
    Cast({
        required this.adult,
        required this.gender,
        required this.id,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        required this.castId,
        required this.character,
        required this.creditId,
        required this.order,
        required this.job,
    });

    bool? adult;
    int? gender;
    int? id;
    String? name;
    String? originalName;
    double? popularity;
    String? profilePath;
    int? castId;
    String? character;
    String? creditId;
    int? order;
    String? job;

get fullPosterImg{

      if(profilePath != null)
        return 'https://image.tmdb.org/t/p/w500${profilePath}';

      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        job: json["job"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "job": job,
    };
}


