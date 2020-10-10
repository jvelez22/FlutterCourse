class Cast {
  List<Character> characters = List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    }
    jsonList.forEach((element) {
      final character = Character.fromJsonMap(element);
      characters.add(character);
    });
  }
}

class Character {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Character({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Character.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getProfileImg() {
    if (profilePath == null) {
      return 'https://www.slotcharter.net/wp-content/uploads/2020/02/no-avatar.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
