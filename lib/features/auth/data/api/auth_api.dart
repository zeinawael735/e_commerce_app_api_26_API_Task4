import 'dart:convert';

import 'package:ecommerce_app_api_26/core/endpoints.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/Token_models.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/badRequestModel.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/error_model.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/successSignUpModel.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<TokenModels> login({required String email, required String password})async{
    Uri url=Uri.parse(Endpoints.BaseURL+Endpoints.login);
    Map<String,dynamic> requestBody={
ApiKeys.email:email,
      ApiKeys.password:password
};
    var response= await http.post(url,body: jsonEncode(requestBody),headers: {
      "Content-Type":"application/json"
    });
    var json=jsonDecode(response.body);

    if(response.statusCode==201||response.statusCode==200){
      TokenModels tokenModels=TokenModels.fromJson(json);
      return tokenModels;
    }
    else{
      ErrorModels errorModels=ErrorModels.fromJson(json);
      throw Exception(errorModels.message);
    }

  }

  Future<SuccessSignUpModel> SignUp({required String name,required String email,required String password, String avatar="https://api.lorem.space/image/face?w=640&h=480"}) async{
    Uri url=Uri.parse(Endpoints.BaseURL+Endpoints.SignUp);
    Map<String,dynamic> requestBody={
      ApiKeys.name:name,
      ApiKeys.email:email,
      ApiKeys.password:password,
      ApiKeys.avatar:avatar
    };
    var response= await http.post(url,body: jsonEncode(requestBody),headers: {
      "Content-Type":"application/json"
    });
    var json=jsonDecode(response.body);

    if(response.statusCode==201){
      SuccessSignUpModel successSignUpModel=SuccessSignUpModel.fromJson(json);
      return successSignUpModel;
    }
    else{
      Badrequestmodel badrequestmodel=Badrequestmodel.fromJson(json);
      throw Exception(badrequestmodel.message);
    }
  }
}