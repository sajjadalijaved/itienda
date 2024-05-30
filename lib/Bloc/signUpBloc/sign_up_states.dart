// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

class SignUpStates extends Equatable {
  final String name;
  final String token;
  final String confirmPassword;
  final String email;
  final String password;
  final String message;
  final bool obsecure;
  final bool obsecure1;
  final PostApiStatus postApiStatus;
  const SignUpStates(
      {this.name = '',
      this.token = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.message = '',
      this.obsecure = true,
      this.obsecure1 = true,
      this.postApiStatus = PostApiStatus.initial});

  SignUpStates copyWith(
      {PostApiStatus? postApiStatus,
      String? name,
      String? token,
      String? email,
      String? password,
      String? confirmPassword,
      String? message,
      bool? obsecure,
      bool? obsecure1}) {
    return SignUpStates(
        name: name ?? this.name,
        token: token ?? this.token,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        message: message ?? this.message,
        obsecure: obsecure ?? this.obsecure,
        obsecure1: obsecure1 ?? this.obsecure1,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object> get props => [
        name,
        token,
        email,
        password,
        confirmPassword,
        message,
        postApiStatus,
        obsecure,
        obsecure1
      ];
}
