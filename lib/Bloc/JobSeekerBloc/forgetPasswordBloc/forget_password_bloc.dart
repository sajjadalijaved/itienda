import 'package:bloc/bloc.dart';
import '../../../Utils/enum.dart';
import 'package:equatable/equatable.dart';
import '../../../repository/auth_repository.dart';

part 'forget_password_events.dart';
part 'forget_password_states.dart';

// ignore_for_file: unnecessary_null_comparison

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvents, ForgetPasswordStates> {
  AuthRepository authRepository = AuthRepository();
  ForgetPasswordBloc() : super(const ForgetPasswordStates()) {
    on<EmailChanged>(_emailChangeHandle);
    on<VerificationCodeFieldChanged>(_verificationFieldChangeHandle);
    on<PasswordChanged>(_passwordChangeHandle);
    on<ConfirmPasswordChanged>(_confirmPasswordChangeHandle);
    on<PasswordVisibilityEvent>(_passwordViewHandle);
    on<ConfirmPasswordVisibilityEvent>(_confirmPasswordViewHandle);
    on<ForgetPasswordSendEmailEvent>(_forgetPasswordSendEmailButton);
    on<VerificationCodeSendEvent>(_verificationCodeSendButton);
    on<NewPasswordEvent>(_newPasswordButton);
  }

  void _emailChangeHandle(
      EmailChanged event, Emitter<ForgetPasswordStates> emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _verificationFieldChangeHandle(
      VerificationCodeFieldChanged event, Emitter<ForgetPasswordStates> emit) {
    emit(
      state.copyWith(code: event.code),
    );
  }

  void _passwordChangeHandle(
      PasswordChanged event, Emitter<ForgetPasswordStates> emit) {
    emit(
      state.copyWith(password: event.password),
    );
  }

  void _confirmPasswordChangeHandle(
      ConfirmPasswordChanged event, Emitter<ForgetPasswordStates> emit) {
    emit(
      state.copyWith(confirmPassword: event.confirmPassword),
    );
  }

  void _passwordViewHandle(
      PasswordVisibilityEvent event, Emitter<ForgetPasswordStates> emit) {
    emit(
      state.copyWith(obsecure: !state.obsecure),
    );
  }

  void _confirmPasswordViewHandle(ConfirmPasswordVisibilityEvent event,
      Emitter<ForgetPasswordStates> emit) {
    emit(
      state.copyWith(obsecure1: !state.obsecure1),
    );
  }

  void _forgetPasswordSendEmailButton(ForgetPasswordSendEmailEvent event,
      Emitter<ForgetPasswordStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    Map data = {
      'email': state.email,
    };

    try {
      var value = await authRepository.forgetPasswordApi(data);

      if (value == null) {
        emit(state.copyWith(
            message: "Received null response from the server.",
            postApiStatus: PostApiStatus.error));
        return;
      }

      if (value['status'] == 'false') {
        emit(state.copyWith(
            message: "User not found for the provided email.",
            postApiStatus: PostApiStatus.error));
      } else {
        emit(state.copyWith(
            message:
                "Send Verification Code To Your Registered Email Successfully.",
            postApiStatus: PostApiStatus.success));
      }
    } catch (error) {
      emit(state.copyWith(
          message: "ForgetPassword Api Error : ${error.toString()}",
          postApiStatus: PostApiStatus.error));
    }
  }

  void _verificationCodeSendButton(VerificationCodeSendEvent event,
      Emitter<ForgetPasswordStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    Map data = {'email': event.userName, 'verification_code': state.code};

    try {
      var value = await authRepository.verificationCodeApi(data);

      if (value == null) {
        emit(state.copyWith(
            message: "Received null response from the server.",
            postApiStatus: PostApiStatus.error));
        return;
      }

      if (value['status'] == 'false') {
        emit(state.copyWith(
            message: "Invalid verification code.",
            postApiStatus: PostApiStatus.error));
      } else {
        emit(state.copyWith(
            userId: value['user_id'],
            message: "Verify Code  Successfully.",
            postApiStatus: PostApiStatus.success));
      }
    } catch (error) {
      emit(state.copyWith(
          message: "Verification Api Error : ${error.toString()}",
          postApiStatus: PostApiStatus.error));
    }
  }

  void _newPasswordButton(
      NewPasswordEvent event, Emitter<ForgetPasswordStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    Map data = {'new_password': state.password, 'user_id': event.userId};

    try {
      var value = await authRepository.newPasswordSetApi(data);

      if (value == null) {
        emit(state.copyWith(
            message: "Received null response from the server.",
            postApiStatus: PostApiStatus.error));
        return;
      }

      if (value['status'] == 'false') {
        emit(state.copyWith(
            message: "Something wrong kindly try again.",
            postApiStatus: PostApiStatus.error));
      } else {
        emit(state.copyWith(
            message: "Password updated successfully.",
            postApiStatus: PostApiStatus.success));
      }
    } catch (error) {
      emit(state.copyWith(
          message: "NewPassword Api Error : ${error.toString()}",
          postApiStatus: PostApiStatus.error));
    }
  }
}
