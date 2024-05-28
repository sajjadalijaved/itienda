import 'dart:io';
import 'dart:developer';
import '../Utils/utils.dart';
import '../config/appurl.dart';
import 'package:flutter/material.dart';
import '../data/network/baseapiservices.dart';
import '../data/network/networkapiservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

// ignore_for_file: unnecessary_string_interpolations

// ignore_for_file: use_rethrow_when_possible

class AuthRepository {
  final BaseApiAServices _baseApiAServices = NetworkApiServices();

// Facebook login method

  Future<UserCredential?> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ["email", 'public_profile'],
      );

      if (loginResult.status == LoginStatus.success) {
        String token = loginResult.accessToken!.tokenString;
        log("Facebook access token: $token");

        final OAuthCredential credential = FacebookAuthProvider.credential(
            loginResult.accessToken!.tokenString);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        return userCredential;
      } else {
        throw FirebaseAuthException(
          code: 'Facebook Login Failed',
          message: 'The Facebook login was not successful.',
        );
      }
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Exception: ${e.message}');
      throw e;
    } catch (e) {
      log('Other Exception: $e');
      throw e;
    }
  }

// google sign in method
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      await InternetAddress.lookup("google.com");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      dynamic user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return user;
    } on FirebaseAuthException catch (e) {
      Utils.errorMessageFlush(e.toString(), context);
      return null;
    } catch (e) {
      log("\nsignInWithGoogle : $e");
      Utils.toastMessage("Some thing went wrong(please check your internet!)");

      return null;
    }
  }

//  sign with email and password in method
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responce =
          await _baseApiAServices.getPostApiResponse(AppUlr.loginUrl, data);
      log("Login api response : $responce");
      return responce;
    } catch (e) {
      log("Login Api Error : $e");
    }
  }

//  sign up method
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responce =
          await _baseApiAServices.getPostApiResponse(AppUlr.registerUrl, data);
      log("Register api response : $responce");
      return responce;
    } catch (e) {
      log("Register Api Error : $e");
    }
  }

// forget get password method
  Future<dynamic> forgetPasswordApi(dynamic data) async {
    try {
      dynamic responce = await _baseApiAServices.getPostForgetApiResponse(
          AppUlr.forgetPasswordUrl, data);
      log("ForgetPassword api response : $responce");
      return responce;
    } catch (e) {
      log("ForgetPassword Api Error : $e");
    }
  }

// verification code method
  Future<dynamic> verificationCodeApi(dynamic data) async {
    try {
      dynamic responce = await _baseApiAServices.getPostForgetApiResponse(
          AppUlr.verificationCodeUrl, data);
      log("verification code api response : $responce");
      return responce;
    } catch (e) {
      log("verification code Error : $e");
    }
  }

  // newpassword set code method
  Future<dynamic> newPasswordSetApi(dynamic data) async {
    try {
      dynamic responce = await _baseApiAServices.getPostApiResponse(
          AppUlr.newPasswordSetUrl, data);
      log("new password api response : $responce");
      return responce;
    } catch (e) {
      log("new password Error : $e");
    }
  }
}
