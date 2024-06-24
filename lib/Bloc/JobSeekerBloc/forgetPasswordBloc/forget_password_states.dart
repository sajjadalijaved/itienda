part of 'forget_password_bloc.dart';

class ForgetPasswordStates extends Equatable {
  final String email;
  final String code;
  final String userId;
  final String password;
  final String confirmPassword;
  final String message;
  final bool obsecure;
  final bool obsecure1;
  final PostApiStatus postApiStatus;
  const ForgetPasswordStates(
      {this.email = '',
      this.userId = '',
      this.password = '',
      this.confirmPassword = '',
      this.message = '',
      this.code = '',
      this.obsecure = true,
      this.obsecure1 = true,
      this.postApiStatus = PostApiStatus.initial});

  ForgetPasswordStates copyWith(
      {PostApiStatus? postApiStatus,
      String? email,
      String? userId,
      String? password,
      String? confirmPassword,
      String? message,
      String? code,
      bool? obsecure,
      bool? obsecure1}) {
    return ForgetPasswordStates(
        email: email ?? this.email,
        userId: userId ?? this.userId,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        message: message ?? this.message,
        obsecure: obsecure ?? this.obsecure,
        obsecure1: obsecure1 ?? this.obsecure1,
        code: code ?? this.code,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object> get props => [
        email,
        userId,
        password,
        message,
        postApiStatus,
        obsecure,
        code,
        confirmPassword,
        obsecure1
      ];
}
