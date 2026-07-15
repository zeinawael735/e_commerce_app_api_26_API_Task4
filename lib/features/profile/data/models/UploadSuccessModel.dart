class UploadSuccessModel {
  String? originalname;
  String? filename;
  String? location;

  UploadSuccessModel({this.originalname, this.filename, this.location});

  UploadSuccessModel.fromJson(Map<String, dynamic> json) {
    originalname = json['originalname'];
    filename = json['filename'];
    location = json['location'];
  }


}