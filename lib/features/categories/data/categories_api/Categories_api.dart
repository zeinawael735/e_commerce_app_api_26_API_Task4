import 'dart:convert';

import 'package:ecommerce_app_api_26/core/endpoints.dart';
import 'package:ecommerce_app_api_26/features/categories/data/models/categoriesModel.dart';
import 'package:http/http.dart' as http;

class CategoriesApi {

   Future<List<CategoriesModel>>getAllCategories()async{
Uri url =Uri.parse(Endpoints.BaseURL+Endpoints.Allcategories);
http.get(url,);
var response= await http.get(url);
var json =jsonDecode(response.body) as List ;

List<CategoriesModel> categories=json.map((e) {
  return CategoriesModel.fromJson(e);

},).toList();

return categories;


  }


}