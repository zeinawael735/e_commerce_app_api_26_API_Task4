import 'dart:convert';

import 'package:ecommerce_app_api_26/core/endpoints.dart';
import 'package:ecommerce_app_api_26/core/storage/storage_helper.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/UploadSuccessModel.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/profileErrorModel.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/profile_models.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

import '../../../auth/data/models/badRequestModel.dart';



class ProfileApi {


  Future<void> updateProfileAvatar(int userid,String newAvatarUrl) async {

    String? token = await StorageHelper.getToken();


    final response = await http.put(
      Uri.parse("${Endpoints.BaseURL}users/$userid"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'avatar': newAvatarUrl,
      }),
    );


    if (response.statusCode != 200 && response.statusCode != 201) {
      Badrequestmodel badrequestmodel = Badrequestmodel.fromJson(jsonDecode(response.body));
      throw Exception(badrequestmodel.message);
    }
  }


  Future<UploadSuccessModel> uploadAvatar(File imageFile) async {

    var request = http.MultipartRequest('POST', Uri.parse(Endpoints.BaseURL + Endpoints.files));




    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));


    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);


    var json = jsonDecode(response.body);


    if (response.statusCode == 200 || response.statusCode == 201) {

      return UploadSuccessModel.fromJson(json);
    } else {

      ProfileErrormodel profileErrormodel = ProfileErrormodel.fromJson(json);
      throw Exception(profileErrormodel.message);
    }
  }





  Future<ProfileModel> getProfile() async {
    Uri url = Uri.parse(Endpoints.BaseURL + Endpoints.profile);
    String? token = await StorageHelper.getToken();
    var response = await http.get(url, headers: {
      "Authorization": "Bearer $token"
    });

    var json = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ProfileModel profileModel = ProfileModel.fromJson(json);
      return profileModel;
    } else {
      ProfileErrormodel profileErrormodel = ProfileErrormodel.fromJson(json);
      throw Exception(profileErrormodel.message);
    }
  }

}

