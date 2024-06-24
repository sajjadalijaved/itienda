import 'package:bloc/bloc.dart';
import 'package:itienda/Utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:itienda/repository/auth_repository.dart';
import 'package:itienda/config/localStorage/local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:itienda/config/sessionManager/session_manager.dart';

// ignore_for_file: use_build_context_synchronously

// ignore_for_file: unnecessary_null_comparison

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  AuthRepository authRepository = AuthRepository();
  LocalStorage localStorage = LocalStorage();
  final storage = const FlutterSecureStorage();
  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_emailChangeHandle);
    on<PasswordChanged>(_passwordChangeHandle);
    on<PasswordVisibility>(_passwordViewHandle);
    on<LoginButtonEvent>(_loginButton);
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

  void _loginButton(LoginButtonEvent event, Emitter<LoginStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    Map<String, dynamic> data = {
      'email': state.email,
      'password': state.password
    };

    try {
      var value = await authRepository.loginApi(data);
      if (value['message'] == 'Invalid credentials') {
        emit(state.copyWith(
            message: "Invalid email or password.",
            postApiStatus: PostApiStatus.error));
      } else {
        await SessionManager().saveUserInPreferance(value);
        await SessionManager().getsaveUserInPreferance();
        await localStorage.setRole(
            key: "role", value: (value["role"] ?? '').toString());
        await localStorage.setValue(
            "businessName", value["business_name"] ?? '');
        emit(state.copyWith(
            message: "User Login Successful",
            role: value["role"] ?? '',
            businessName: value["business_name"] ?? '',
            postApiStatus: PostApiStatus.success));
      }
    } catch (error) {
      emit(state.copyWith(
          message: error.toString(), postApiStatus: PostApiStatus.error));
    }
  }
}
