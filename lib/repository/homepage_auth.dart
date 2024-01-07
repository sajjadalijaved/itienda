import 'appurl.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: unnecessary_string_interpolations

// global variables
String? email1;
String? id;
String? token;

// accessToken method

Future accesstoken() async {
  try {
    Response response = await post(Uri.parse(AppUlr.accessTokenUrl), body: {
      'refresh_token':
          "1000.7753bf009058a09f80c08167c0a66de9.f27a2b49edec91f0267dc14b05492f4d",
      'client_id': "1000.IZL45T6QKKKB8F3RCSE2B5SJW9LNFI",
      'client_secret': "970dc82cbcf9a08011dc5a1db913db7eb7b4261ef5",
      'grant_type': "refresh_token"
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log("AccessData : $data");
      token = data['access_token'];
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

Future senddata(
    {required String firstname,
    required String lastname,
    required String email,
    required String phonenumber,
    required String latitude,
    required String longitude}) async {
  try {
    log("token : $token");
    Map<String, String> headers = {"Authorization": "Zoho-oauthtoken $token"};
    Map<String, dynamic> data = {
      "data": [
        {
          "First_Name": "$firstname",
          "Last_Name": "$lastname",
          "Email": "$email",
          "Mobile": "$phonenumber",
          "Latitude": "$latitude",
          "Longitude": "$longitude"
        },
      ],
    };
    var response = await post(
        Uri.parse(
          AppUlr.sendDataUrl,
        ),
        body: jsonEncode(data),
        headers: headers);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      log("sendData : $data");
    } else {
      log("Error :${response.statusCode}");
    }
  } catch (e) {
    if (kDebugMode) {
      log("err0r : $e");
    }
  }
}

// search user through email method
Future getSearchThroughEmail({required String email}) async {
  try {
    Map<String, String> headers = {"Authorization": "Zoho-oauthtoken $token"};
    var response = await get(
        Uri.parse(
            "https://www.zohoapis.com/crm/v5/Contacts/search?email=$email"),
        headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      log("Get Email Data : $data");
      email1 = data['data'][0]['Email'];
      id = data['data'][0]['id'];
      log("Get Email Data1 : $email1");
      log("ID Data : $id");
    } else {
      log("Error :${response.statusCode}");
    }
  } catch (e) {
    log("err0r : $e");
  }
}

// update data method
Future updateData({required String latitude, required String longitude}) async {
  try {
    Map<String, String> headers = {"Authorization": "Zoho-oauthtoken $token"};
    Map<String, dynamic> data = {
      "data": [
        {"Latitude": "$latitude", "Longitude": "$longitude"},
      ],
    };
    var response = await put(
        Uri.parse("https://www.zohoapis.com/crm/v2/Contacts/$id"),
        body: jsonEncode(data),
        headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      log("UpdateData : $data");
    } else {
      log("Error :${response.statusCode}");
    }
  } catch (e) {
    log("err0r : $e");
  }
}

// get email method
String? getEmail() {
  return email1;
}
