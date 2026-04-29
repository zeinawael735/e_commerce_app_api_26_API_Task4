class Badrequestmodel {
  List<String>? message;
  String? error;
  int? statusCode;

  Badrequestmodel({this.message, this.error, this.statusCode});

  Badrequestmodel.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    error = json['error'];
    statusCode = json['statusCode'];
  }
}