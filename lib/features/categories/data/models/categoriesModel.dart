class CategoriesModel {
  int? id;
  String? name;
  String? slug;
  String? image;


  CategoriesModel(
      {this.id,
        this.name,
        this.slug,
        this.image,
        });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];

  }

}