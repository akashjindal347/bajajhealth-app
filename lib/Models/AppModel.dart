import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends Model {
  String _token;
  String _userId;
  Map <String, dynamic> _userInfo;

  String get token => _token;
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

  void setUserInfo (Map <String, dynamic> t) async {
    _userInfo = t;
    notifyListeners();
  }
}