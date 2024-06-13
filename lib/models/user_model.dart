// ignore_for_file: non_constant_identifier_names

class UserModel {
  dynamic token;
  UserModel({
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
