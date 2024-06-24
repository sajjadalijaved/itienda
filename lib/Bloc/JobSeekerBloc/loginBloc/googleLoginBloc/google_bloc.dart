import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:itienda/repository/auth_repository.dart';
import 'package:itienda/config/localStorage/local_storage.dart';
import 'package:itienda/config/sessionManager/session_manager.dart';
import 'package:itienda/Widgets/loginWithGoogleDialog/show_dialog.dart';

// ignore_for_file: use_build_context_synchronously

// ignore_for_file: unnecessary_null_comparison

part 'google_events.dart';
part 'google_state.dart';

class GoogleLoginBloc extends Bloc<GoogleLoginEvents, GoogleLoginStates> {
  AuthRepository authRepository = AuthRepository();
  LocalStorage localStorage = LocalStorage();

  GoogleLoginBloc() : super(const GoogleLoginStates()) {
    on<SelectRadioButton>(_selectRadioButtonHandle);
    on<BusinessNameLoginChanged>(_businessNameChangeHandle);
    on<GoogleLoginEvent>(_googleSignInButton);
  }

  void _businessNameChangeHandle(
      BusinessNameLoginChanged event, Emitter<GoogleLoginStates> emit) {
    emit(state.copyWith(businessName: event.businessName));
  }

  void _selectRadioButtonHandle(
      SelectRadioButton event, Emitter<GoogleLoginStates> emit) {
    final newRole = event.selectedValue;
    emit(
      state.copyWith(role: newRole),
    );
    log("Role updated to: $newRole");
  }

  void _googleSignInButton(
    GoogleLoginEvent event,
    Emitter<GoogleLoginStates> emit,
  ) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );

    try {
      final value = await authRepository.signInWithGoogle(event.context);
      log("Google response: $value");

      if (value == null ||
          value.user == null ||
          value.additionalUserInfo == null ||
          value.user!.uid == null) {
        if (!emit.isDone) {
          emit(state.copyWith(
            message: "Something went wrong please try again.",
            postApiStatus: PostApiStatus.error,
          ));
        }
      } else {
        final isFirstLogin =
            await localStorage.getValue(key: 'isFirstLogin') ?? 'true';
        final storedRole = await localStorage.getValue(key: 'role');

        if (isFirstLogin == 'true') {
          await _insertDataToDatabase("first time login insert data.");
          await localStorage.setValue('isFirstLogin', 'false');
        } else {
          if (storedRole != state.role.toString()) {
            await _insertDataToDatabase(
                "role update so data insert into data base");
          }
        }

        Map<String, dynamic> userData = {
          'token': value.user!.uid,
        };
        await SessionManager().saveUserInPreferance(userData);
        await showDialog(
          context: event.context,
          builder: (context) => CustomDialog(),
        );

        if (!emit.isDone) {
          emit(state.copyWith(
            message: "User Login With Google Successful",
            postApiStatus: PostApiStatus.success,
          ));
        }
      }
    } catch (error) {
      if (!emit.isDone) {
        emit(state.copyWith(
          message: error.toString(),
          postApiStatus: PostApiStatus.error,
        ));
      }
    }
  }
}

Future<void> _insertDataToDatabase(String message) async {
  log(message);
}
