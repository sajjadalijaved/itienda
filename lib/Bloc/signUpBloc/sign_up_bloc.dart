import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:itienda/Utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/repository/auth_repository.dart';
import 'package:itienda/config/sessionManager/session_manager.dart';

// ignore_for_file: unnecessary_null_comparison

part 'sign_up_event.dart';
part 'sign_up_states.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  AuthRepository authRepository = AuthRepository();
  SignUpBloc() : super(const SignUpStates()) {
    on<NameChanged>(_nameChangeHandle);
    on<EmailSignUpChanged>(_emailChangeHandle);
    on<PasswordSignUpChanged>(_passwordChangeHandle);
    on<ConfirmPasswordSignUpChanged>(_confirmPasswordChangeHandle);
    on<BusinessNameSignUpChanged>(_businessNameChangeHandle);
    on<PasswordVisibilitySignUp>(_passwordViewHandle);
    on<ConfirmPasswordVisibilitySignUp>(_confirmPasswordViewHandle);
    on<SelectRadioButton>(_selectRadioButtonHandle);
    on<SignUpButtonEvent>(_signUpButton);
    on<GoogleSignUpEvent>(_googleSignUpButton);
  }

  void _nameChangeHandle(NameChanged event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(name: event.name),
    );
  }

  void _emailChangeHandle(
      EmailSignUpChanged event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _passwordChangeHandle(
      PasswordSignUpChanged event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(password: event.password),
    );
  }

  void _confirmPasswordChangeHandle(
      ConfirmPasswordSignUpChanged event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(confirmPassword: event.confirmPassword),
    );
  }

  void _businessNameChangeHandle(
      BusinessNameSignUpChanged event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(businessName: event.businessName),
    );
  }

  void _passwordViewHandle(
      PasswordVisibilitySignUp event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(obsecure: !state.obsecure),
    );
  }

  void _confirmPasswordViewHandle(
      ConfirmPasswordVisibilitySignUp event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(obsecure1: !state.obsecure1),
    );
  }

  void _selectRadioButtonHandle(
      SelectRadioButton event, Emitter<SignUpStates> emit) {
    emit(
      state.copyWith(selectvalue: event.selectedValue),
    );
  }

  void _signUpButton(
      SignUpButtonEvent event, Emitter<SignUpStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    Map data = {
      "name": state.name,
      "email": state.email,
      "password": state.password,
      "password_confirmation": state.confirmPassword,
      "role": state.selectvalue,
      "business_name": state.businessName,
      "notification_token": event.token
    };

    await authRepository.registerApi(data).then((value) async {
      if (value['message'] == 'User registered successfully') {
        await SessionManager().saveUserInPreferance(value);
        await SessionManager().getsaveUserInPreferance();
        emit(state.copyWith(
            message: "User Register Succcessfully.",
            postApiStatus: PostApiStatus.success));
      } else {
        emit(state.copyWith(
            message: "User with this email already exists.",
            postApiStatus: PostApiStatus.error));
      }
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            message: "Something went wrong kindly try later.",
            postApiStatus: PostApiStatus.error));
      },
    );
  }

  void _googleSignUpButton(
    GoogleSignUpEvent event,
    Emitter<SignUpStates> emit,
  ) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );

    await authRepository.signInWithGoogle(event.context).then((value) {
      log("Google response sign up:$value");
      if (value == null &&
          value!.user == null &&
          value.additionalUserInfo == null &&
          value.user!.uid == null) {
        emit(state.copyWith(
            message: "Something went wrong please try again.",
            postApiStatus: PostApiStatus.error));
      } else {
        emit(state.copyWith(
            message: "User Register Succcessfully.",
            postApiStatus: PostApiStatus.success));
      }
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error));
      },
    );
  }
}
