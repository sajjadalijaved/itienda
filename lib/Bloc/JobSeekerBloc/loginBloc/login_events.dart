// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvents {
  final String email;
  const EmailChanged({required this.email});
  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvents {
  final String password;
  const PasswordChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class PasswordVisibility extends LoginEvents {
  const PasswordVisibility();
}

class EmailUnFocused extends LoginEvents {}

class PasswordUnFocused extends LoginEvents {}

class LoginButtonEvent extends LoginEvents {
  const LoginButtonEvent();
}
