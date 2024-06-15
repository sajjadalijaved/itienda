// ignore_for_file: must_be_immutable

part of 'google_bloc.dart';

class GoogleLoginStates extends Equatable {
  final String businessName;
  final String message;
  final int role;
  final PostApiStatus postApiStatus;
  const GoogleLoginStates(
      {this.businessName = '',
      this.role = 1,
      this.message = '',
      this.postApiStatus = PostApiStatus.initial});

  GoogleLoginStates copyWith({
    PostApiStatus? postApiStatus,
    String? businessName,
    String? message,
    int? role,
  }) {
    return GoogleLoginStates(
        message: message ?? this.message,
        businessName: businessName ?? this.businessName,
        role: role ?? this.role,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object> get props => [message, postApiStatus, role, businessName];
}
