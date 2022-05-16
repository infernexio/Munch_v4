class Ingredients {
  final int id;
  final String name;
  final int stars;
  final String img;

  Ingredients(
      { 
      required this.id,
      required this.name,
      required this.stars,
      required this.img,
      });

  Ingredients.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        stars = res["stars"],
        img = res["img"];

  Map<String, Object?> toMap() {
    return {'id':id,'name': name, 'stars': stars, 'img': img};
  }
}