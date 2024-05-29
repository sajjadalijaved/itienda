// ignore_for_file: non_constant_identifier_names

class UserModel {
  String? user_id;

  UserModel({this.user_id});

  UserModel.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = user_id;
    return data;
  }
}
