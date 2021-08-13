class SignIn {
  bool isOK = false;
  String? message;
  String? action;
  var params;
  String? accessToken;
  String? refreshToken;

  SignIn(
      {required this.isOK,
      this.message,
      this.action,
      this.params,
      this.accessToken,
      this.refreshToken});

  SignIn.fromJson(Map<String, dynamic> json) {
    isOK = json['isOK'];
    message = json['message'];
    action = json['action'];
    params = json['params'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}
