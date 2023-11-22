class CharacterList {
  final List<CharacterDetail> results;

  CharacterList({
    required this.results,
  });
}

class CharacterDetail {
  final String name;
  final String status;
  final String species;

  final String gender;

  final String image;

  final String url;

  CharacterDetail({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.url,
  });
}
