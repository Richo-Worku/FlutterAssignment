class Results {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;
  late Origin origin;
  late String location;
  late String episode;
  late String url;
  late String created;

  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
    //  required this.location,
    //  required this.episode,
    required this.url,
    required this.created,
  });
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      image: json["image"],
      origin: Origin.fromJson(json["origin"]),

      //  location: json["location"],
      // episode: json["episode"],
      url: json["url"],
      created: json["created"],
    );
  }
}

class Origin {
  String name = '';
  String url = '';

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      url: json["url"] as String,
      name: json["name"] as String,
    );
  }
}
