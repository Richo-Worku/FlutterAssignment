class Locations {
  late int id;
  late String name;
  late String type;
  late String dimension;
  late String url;
  late String created;

  Locations({
    required this.id,
    required this.name,
    required this.dimension,
    // required this.residents,
    required this.type,
    required this.url,
    required this.created,
    //  required this.location,
    //  required this.episode,
  });
  factory Locations.fromJson(Map<String, dynamic> json) {
    return Locations(
      id: json["id"],
      name: json["name"],
      dimension: json["dimension"],
      url: json["url"],
      type: json["type"],
      created: json["created"],
      // residents: Origin.fromJson(json["residents"]),

      //  location: json["location"],
      // episode: json["episode"],
    );
  }
}
