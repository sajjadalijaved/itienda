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

class SelectRadioButton extends LoginEvents {
  final int? selectedValue;

  const SelectRadioButton({required this.selectedValue});
  @override
  List<Object?> get props => [selectedValue];
}

class PasswordVisibility extends LoginEvents {
  const PasswordVisibility();
}

class EmailUnFocused extends LoginEvents {}

class PasswordUnFocused extends LoginEvents {}

class LoginButtonEvent extends LoginEvents {
  const LoginButtonEvent();
}

class GoogleSignInEvent extends LoginEvents {
  final BuildContext context;
  const GoogleSignInEvent({required this.context});
  @override
  List<Object> get props => [context];
}
