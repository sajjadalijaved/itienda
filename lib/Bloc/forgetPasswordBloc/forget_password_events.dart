part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvents extends Equatable {
  const ForgetPasswordEvents();
  @override
  List<Object> get props => [];
}

class EmailChanged extends ForgetPasswordEvents {
  final String email;
  const EmailChanged({required this.email});
  @override
  List<Object> get props => [email];
}

class VerificationCodeFieldChanged extends ForgetPasswordEvents {
  final String code;
  const VerificationCodeFieldChanged({required this.code});
  @override
  List<Object> get props => [code];
}

class PasswordChanged extends ForgetPasswordEvents {
  final String password;
  const PasswordChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends ForgetPasswordEvents {
  final String confirmPassword;
  const ConfirmPasswordChanged({required this.confirmPassword});
  @override
  List<Object> get props => [confirmPassword];
}

class EmailUnFocused extends ForgetPasswordEvents {}

class VerificationCodeFieldUnFocus extends ForgetPasswordEvents {}

class ForgetPasswordSendEmailEvent extends ForgetPasswordEvents {
  const ForgetPasswordSendEmailEvent();
}

class VerificationCodeSendEvent extends ForgetPasswordEvents {
  final String userName;
  const VerificationCodeSendEvent({required this.userName});
  @override
  List<Object> get props => [userName];
}

class NewPasswordEvent extends ForgetPasswordEvents {
  final String userId;
  const NewPasswordEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}

class PasswordVisibilityEvent extends ForgetPasswordEvents {
  const PasswordVisibilityEvent();
}

class ConfirmPasswordVisibilityEvent extends ForgetPasswordEvents {
  const ConfirmPasswordVisibilityEvent();
}
