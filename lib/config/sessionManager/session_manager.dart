import 'dart:convert';
import 'dart:developer';
import 'package:itienda/models/user_model.dart';
import 'package:itienda/config/localStorage/local_storage.dart';

class SessionManager {
  static final SessionManager _manager = SessionManager._internal();
  final LocalStorage localStorage = LocalStorage();
  static bool? isLoging;
  static UserModel user = UserModel();
  SessionManager._internal() {
    isLoging = false;
  }

  factory SessionManager() {
    return _manager;
  }
  Future<void> saveUserInPreferance(dynamic token) async {
    localStorage.setValue("token", jsonEncode(token));
    localStorage.setValue("isLogin", "true");
  }

  Future<void> getsaveUserInPreferance() async {
    try {
      var token = await localStorage.getValue(key: "token");
      var isLogin = await localStorage.getValue(key: "isLogin");

      if (token.isNotEmpty) {
        SessionManager.user = UserModel.fromJson(jsonDecode(token));
      }
      SessionManager.isLoging = isLogin == 'true' ? true : false;
    } catch (e) {
      log("User SaveError:${e.toString()}");
    }
  }
}
