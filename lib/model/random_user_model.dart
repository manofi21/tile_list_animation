// To parse this JSON data, do
class RandmomPeople {
    final List<ResultRandomPeople> results;
    final Info info;

    RandmomPeople({
        required this.results,
        required this.info,
    });

    RandmomPeople copyWith({
        List<ResultRandomPeople>? results,
        Info? info,
    }) => 
        RandmomPeople(
            results: results ?? this.results,
            info: info ?? this.info,
        );

    static RandmomPeople fromJson(Map<String, dynamic> json) => RandmomPeople(
        results: List<ResultRandomPeople>.from(json["results"].map((x) => ResultRandomPeople.fromJson(x))),
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
    };
}

class Info {
    final String seed;
    final int results;
    final int page;
    final String version;

    Info({
        required this.seed,
        required this.results,
        required this.page,
        required this.version,
    });

    Info copyWith({
        String? seed,
        int? results,
        int? page,
        String? version,
    }) => 
        Info(
            seed: seed ?? this.seed,
            results: results ?? this.results,
            page: page ?? this.page,
            version: version ?? this.version,
        );

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
    };
}

class ResultRandomPeople {
    final Name name;
    final Picture picture;

    ResultRandomPeople({
        required this.name,
        required this.picture,
    });

    ResultRandomPeople copyWith({
        Name? name,
        Picture? picture,
    }) => 
        ResultRandomPeople(
            name: name ?? this.name,
            picture: picture ?? this.picture,
        );

    factory ResultRandomPeople.fromJson(Map<String, dynamic> json) => ResultRandomPeople(
        name: Name.fromJson(json["name"]),
        picture: Picture.fromJson(json["picture"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "picture": picture.toJson(),
    };
}

class Name {
    final String title;
    final String first;
    final String last;

    Name({
        required this.title,
        required this.first,
        required this.last,
    });

    Name copyWith({
        String? title,
        String? first,
        String? last,
    }) => 
        Name(
            title: title ?? this.title,
            first: first ?? this.first,
            last: last ?? this.last,
        );

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    final String large;
    final String medium;
    final String thumbnail;

    Picture({
        required this.large,
        required this.medium,
        required this.thumbnail,
    });

    Picture copyWith({
        String? large,
        String? medium,
        String? thumbnail,
    }) => 
        Picture(
            large: large ?? this.large,
            medium: medium ?? this.medium,
            thumbnail: thumbnail ?? this.thumbnail,
        );

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
