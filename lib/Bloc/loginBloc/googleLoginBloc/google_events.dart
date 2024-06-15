part of 'google_bloc.dart';

abstract class GoogleLoginEvents extends Equatable {
  const GoogleLoginEvents();
  @override
  List<Object?> get props => [];
}

class BusinessNameLoginChanged extends GoogleLoginEvents {
  final String businessName;
  const BusinessNameLoginChanged({required this.businessName});
  @override
  List<Object> get props => [businessName];
}

class SelectRadioButton extends GoogleLoginEvents {
  final int? selectedValue;

  const SelectRadioButton({required this.selectedValue});
  @override
  List<Object?> get props => [selectedValue];
}

class GoogleLoginEvent extends GoogleLoginEvents {
  final BuildContext context;
  const GoogleLoginEvent({required this.context});
  @override
  List<Object> get props => [context];
}
