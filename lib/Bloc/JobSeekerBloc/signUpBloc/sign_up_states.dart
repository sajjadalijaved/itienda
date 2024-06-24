// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

class SignUpStates extends Equatable {
  final String name;
  final String businessName;
  final String token;
  final String confirmPassword;
  final String email;
  final String password;
  final String message;
  final bool obsecure;
  final bool obsecure1;
  final int selectvalue;
  final PostApiStatus postApiStatus;
  const SignUpStates(
      {this.name = '',
      this.businessName = '',
      this.token = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.message = '',
      this.selectvalue = 1,
      this.obsecure = true,
      this.obsecure1 = true,
      this.postApiStatus = PostApiStatus.initial});

  SignUpStates copyWith(
      {PostApiStatus? postApiStatus,
      String? name,
      String? businessName,
      String? token,
      String? email,
      String? password,
      String? confirmPassword,
      String? message,
      bool? obsecure,
      bool? obsecure1,
      int? selectvalue}) {
    return SignUpStates(
        name: name ?? this.name,
        businessName: businessName ?? this.businessName,
        token: token ?? this.token,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        message: message ?? this.message,
        obsecure: obsecure ?? this.obsecure,
        obsecure1: obsecure1 ?? this.obsecure1,
        selectvalue: selectvalue ?? this.selectvalue,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object> get props => [
        name,
        businessName,
        token,
        email,
        password,
        confirmPassword,
        message,
        postApiStatus,
        obsecure,
        obsecure1,
        selectvalue
      ];
}
