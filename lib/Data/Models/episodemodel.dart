class Episodes {
  late int id;
  late String name;
  late String air_date;
  late String episode;
  late String url;
  //late Origin residents;
  late String created;

  Episodes({
    required this.id,
    required this.name,
    required this.air_date,
    // required this.residents,
    required this.url,
    required this.created,
    //  required this.location,
    required this.episode,
  });
  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      id: json["id"],
      name: json["name"],
      air_date: json["air_date"],
      url: json["url"],
      episode: json["episode"],
      created: json["created"],
      // residents: Origin.fromJson(json["residents"]),

      //  location: json["location"],
      // episode: json["episode"],
    );
  }
}
