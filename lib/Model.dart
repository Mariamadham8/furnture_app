import 'package:flutter/foundation.dart';

class UserInfo with ChangeNotifier {
  String _name;
  String _email;
  String _mobile;
  String _pass;

  UserInfo({
    String name = "",
    String email = "",
    String mobile = "",
    String pass = "",
  })  : _name = name,
        _email = email,
        _mobile = mobile,
        _pass = pass;

  // getters
  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;
  String get pass => _pass;

  // setters with notifyListeners
  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setpass(String newpasss) {
    _pass = newpasss;
    notifyListeners();
  }

  void setnum(String newnum) {
    _mobile = newnum;
    notifyListeners();
  }


}
