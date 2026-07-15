import 'package:ecommerce_app_api_26/features/categories/data/models/categoriesModel.dart';

class ProductsModel {
  int? id;
  String? title;

  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;

  ProductsModel(
      {this.id,
        this.title,

        this.price,
        this.description,
        this.category,
        this.images,
       });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ?  CategoriesModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();

  }


}
