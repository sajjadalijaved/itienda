part of 'edit_profile_bloc.dart';

abstract class EditProfileBusinessOwnerEvents extends Equatable {
  const EditProfileBusinessOwnerEvents();
  @override
  List<Object> get props => [];
}

class NotesChangeEvent extends EditProfileBusinessOwnerEvents {
  final String notes;
  const NotesChangeEvent({required this.notes});
  @override
  List<Object> get props => [notes];
}

class DateChangeBusinessOwnerEvent extends EditProfileBusinessOwnerEvents {
  final String date;
  const DateChangeBusinessOwnerEvent({required this.date});
  @override
  List<Object> get props => [date];
}

class YesBusinessOwnerBoxEvent extends EditProfileBusinessOwnerEvents {
  const YesBusinessOwnerBoxEvent();
}

class NoBusinessOwnerBoxEvent extends EditProfileBusinessOwnerEvents {
  const NoBusinessOwnerBoxEvent();
}

class Yes1BusinessOwnerBoxEvent extends EditProfileBusinessOwnerEvents {
  const Yes1BusinessOwnerBoxEvent();
}

class No1BusinessOwnerBoxEvent extends EditProfileBusinessOwnerEvents {
  const No1BusinessOwnerBoxEvent();
}

class Yes2BusinessOwnerBoxEvent extends EditProfileBusinessOwnerEvents {
  const Yes2BusinessOwnerBoxEvent();
}

class No2BusinessOwnerBoxEvent extends EditProfileBusinessOwnerEvents {
  const No2BusinessOwnerBoxEvent();
}

class Yes3BoxEvent extends EditProfileBusinessOwnerEvents {
  const Yes3BoxEvent();
}

class No3BoxEvent extends EditProfileBusinessOwnerEvents {
  const No3BoxEvent();
}

class DontGoogleBusinessBoxEvent extends EditProfileBusinessOwnerEvents {
  const DontGoogleBusinessBoxEvent();
}

class YesWithGoogleBusinessBoxEvent extends EditProfileBusinessOwnerEvents {
  const YesWithGoogleBusinessBoxEvent();
}

class ZeroBoxEvent extends EditProfileBusinessOwnerEvents {
  const ZeroBoxEvent();
}

class OneBoxEvent extends EditProfileBusinessOwnerEvents {
  const OneBoxEvent();
}

class TwoBoxEvent extends EditProfileBusinessOwnerEvents {
  const TwoBoxEvent();
}

class ThreeBoxEvent extends EditProfileBusinessOwnerEvents {
  const ThreeBoxEvent();
}

class SelectImageSocialNetworkBoxEvent extends EditProfileBusinessOwnerEvents {
  const SelectImageSocialNetworkBoxEvent();
}

class YesWithSelectImageSocialNetworkBoxEvent
    extends EditProfileBusinessOwnerEvents {
  const YesWithSelectImageSocialNetworkBoxEvent();
}

class EditProfileBusinessOwnerButtonEvent
    extends EditProfileBusinessOwnerEvents {
  const EditProfileBusinessOwnerButtonEvent();
}
