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
  Future<void> saveUserInPreferance(dynamic userId) async {
    localStorage.setValue("user_id", jsonEncode(userId));
    localStorage.setValue("isLogin", "true");
  }

  Future<void> getsaveUserInPreferance() async {
    try {
      var userId = await localStorage.getValue("user_id");
      var isLogin = await localStorage.getValue("isLogin");

      if (userId.isNotEmpty) {
        SessionManager.user = UserModel.fromJson(jsonDecode(userId));
      }
      SessionManager.isLoging = isLogin == 'true' ? true : false;
    } catch (e) {
      log("User SaveError:${e.toString()}");
    }
  }
}
