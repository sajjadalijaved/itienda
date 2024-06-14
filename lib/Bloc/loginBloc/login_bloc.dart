import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:itienda/Utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:itienda/repository/auth_repository.dart';
import 'package:itienda/config/localStorage/local_storage.dart';
import 'package:itienda/config/sessionManager/session_manager.dart';

// ignore_for_file: unnecessary_null_comparison

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  AuthRepository authRepository = AuthRepository();
  LocalStorage localStorage = LocalStorage();
  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_emailChangeHandle);
    on<PasswordChanged>(_passwordChangeHandle);
    on<PasswordVisibility>(_passwordViewHandle);
    on<SelectRadioButton>(_selectRadioButtonHandle);
    on<LoginButtonEvent>(_loginButton);
    on<GoogleSignInEvent>(_googleSignInButton);
  }

  void _emailChangeHandle(EmailChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _passwordChangeHandle(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(password: event.password),
    );
  }

  void _passwordViewHandle(
      PasswordVisibility event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(obsecure: !state.obsecure),
    );
  }

  void _selectRadioButtonHandle(
      SelectRadioButton event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(role: event.selectedValue),
    );
  }

  void _loginButton(LoginButtonEvent event, Emitter<LoginStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    Map<String, dynamic> data = {
      'email': state.email,
      'password': state.password
    };

    await authRepository.loginApi(data).then((value) async {
      if (value['message'] == 'Invalid credentials') {
        emit(state.copyWith(
            message: "Invalid email or password.",
            postApiStatus: PostApiStatus.error));
      } else {
        await SessionManager().saveUserInPreferance(value);
        await SessionManager().getsaveUserInPreferance();
        await localStorage.setRole(
            key: "role", value: value["role"].toString());
        emit(state.copyWith(
            message: "User Login Succcessful",
            role: value["role"],
            postApiStatus: PostApiStatus.success));
      }
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.error));
      },
    );
  }

  void _googleSignInButton(
    GoogleSignInEvent event,
    Emitter<LoginStates> emit,
  ) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );

    await authRepository.signInWithGoogle(event.context).then((value) {
      log("Google response:$value");
      if (value == null &&
          value!.user == null &&
          value.additionalUserInfo == null &&
          value.user!.uid == null) {
        emit(state.copyWith(
            message: "Something went wrong please try again.",
            postApiStatus: PostApiStatus.error));
      } else {
        emit(state.copyWith(
            message: "User Login Succcessful",
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
