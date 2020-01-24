import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  String _token;
  String _userId;
  String _gToken;
  Map <String, dynamic> _userInfo;

  String get token => _token;
  String get gToken => _gToken;
  String get userId => _userId;
  Map <String, dynamic> get userInfo => _userInfo;

  void setToken (String t) async {
    _token = t;
    notifyListeners();
  }

  void setUserId (String t) async {
    _userId = t;
    notifyListeners();
  }

  void setgToken (String t) async {
    _gToken = t;
    notifyListeners();
  }

  void setUserInfo (Map <String, dynamic> t) async {
    _userInfo = t;
    notifyListeners();
  }
}