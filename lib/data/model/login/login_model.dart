class LoginModel {
  String? _code;
  String? _message;
  Access? _data;

  LoginModel({String? code, String? message, Access? data}) {
    if (code != null) {
      _code = code;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get message => _message;
  set message(String? message) => _message = message;
  Access? get data => _data;
  set data(Access? data) => _data = data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Access.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = _code;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    return data;
  }
}

class Access {
  String? _accessToken;

  Access({String? accessToken}) {
    if (accessToken != null) {
      _accessToken = accessToken;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;

  Access.fromJson(Map<String, dynamic> json) {
    _accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accessToken'] = _accessToken;
    return data;
  }
}
