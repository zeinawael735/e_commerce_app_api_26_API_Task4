class TokenModels {

  String? accessToken;
  String? refreshToken;

  TokenModels({this.accessToken, this.refreshToken});

  TokenModels.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}

