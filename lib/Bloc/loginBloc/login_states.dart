// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final String message;
  final bool obsecure;
  final PostApiStatus postApiStatus;
  const LoginStates(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.obsecure = true,
      this.postApiStatus = PostApiStatus.initial});

  LoginStates copyWith(
      {PostApiStatus? postApiStatus,
      String? email,
      String? password,
      String? message,
      bool? obsecure}) {
    return LoginStates(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        obsecure: obsecure ?? this.obsecure,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object> get props => [email, password, message, postApiStatus, obsecure];
}
