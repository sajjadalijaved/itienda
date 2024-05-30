part of 'sign_up_bloc.dart';

abstract class SignUpEvents extends Equatable {
  const SignUpEvents();
  @override
  List<Object> get props => [];
}

class NameChanged extends SignUpEvents {
  final String name;
  const NameChanged({
    required this.name,
  });
  @override
  List<Object> get props => [name];
}

class EmailSignUpChanged extends SignUpEvents {
  final String email;
  const EmailSignUpChanged({required this.email});
  @override
  List<Object> get props => [email];
}

class PasswordSignUpChanged extends SignUpEvents {
  final String password;
  const PasswordSignUpChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class ConfirmPasswordSignUpChanged extends SignUpEvents {
  final String confirmPassword;
  const ConfirmPasswordSignUpChanged({required this.confirmPassword});
  @override
  List<Object> get props => [confirmPassword];
}

class PasswordVisibilitySignUp extends SignUpEvents {
  const PasswordVisibilitySignUp();
}

class ConfirmPasswordVisibilitySignUp extends SignUpEvents {
  const ConfirmPasswordVisibilitySignUp();
}

class EmailUnFocused extends SignUpEvents {}

class PasswordUnFocused extends SignUpEvents {}

class NameUnFocused extends SignUpEvents {}

class ConfirmPasswordUnFocused extends SignUpEvents {}

class SignUpButtonEvent extends SignUpEvents {
  final String token;
  const SignUpButtonEvent({required this.token});
  @override
  List<Object> get props => [token];
}

class GoogleSignUpEvent extends SignUpEvents {
  final BuildContext context;
  const GoogleSignUpEvent({required this.context});
  @override
  List<Object> get props => [context];
}
