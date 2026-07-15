import 'dart:convert';

import 'package:ecommerce_app_api_26/core/endpoints.dart';
import 'package:ecommerce_app_api_26/features/home/data/models/ProductsModel.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
   Future<List<ProductsModel>> getProducts()async{

   Uri url =Uri.parse(Endpoints.BaseURL+Endpoints.products);
   var response= await http.get(url);
   var json =jsonDecode(response.body) as List ;

   List<ProductsModel> products=json.map((e) {
    return ProductsModel.fromJson(e);

   },).toList();

   return products;


  }


   Future<List<ProductsModel>>getProductsbyCategries(int categoryid)async{

    Uri url =Uri.parse(Endpoints.BaseURL+Endpoints.products+"?categoryId=$categoryid");
    var response= await http.get(url);
    var json =jsonDecode(response.body) as List ;

    List<ProductsModel> products=json.map((e) {
      return ProductsModel.fromJson(e);

    },).toList();

    return products;

  }
}
