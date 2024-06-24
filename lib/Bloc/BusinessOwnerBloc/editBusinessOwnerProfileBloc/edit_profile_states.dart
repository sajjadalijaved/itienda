part of 'edit_profile_bloc.dart';

class EditProfileBusinessOwnerStates extends Equatable {
  final String date;
  final String notes;
  final bool yes;
  final bool no;
  final bool yes1;
  final bool no1;
  final bool yes2;
  final bool no2;
  final bool yes3;
  final bool no3;
  final bool zero;
  final bool one;
  final bool two;
  final bool three;
  final bool yesWithGoogleBusiness;
  final bool dontGoogleBusiness;
  final bool yesWithSelectImageSocialNetwork;
  final bool selectImageSocialNetwork;
  final String message;
  final PostApiStatus postApiStatus;

  const EditProfileBusinessOwnerStates(
      {this.date = '',
      this.notes = '',
      this.yes = false,
      this.no = false,
      this.yes1 = false,
      this.no1 = false,
      this.yes2 = false,
      this.no2 = false,
      this.yes3 = false,
      this.no3 = false,
      this.zero = false,
      this.one = false,
      this.two = false,
      this.three = false,
      this.yesWithGoogleBusiness = false,
      this.dontGoogleBusiness = false,
      this.yesWithSelectImageSocialNetwork = false,
      this.selectImageSocialNetwork = false,
      this.message = '',
      this.postApiStatus = PostApiStatus.initial});

  EditProfileBusinessOwnerStates copyWith(
      {String? date,
      String? notes,
      bool? yes,
      bool? no,
      bool? yes1,
      bool? no1,
      bool? yes2,
      bool? no2,
      bool? yes3,
      bool? no3,
      bool? zero,
      bool? one,
      bool? two,
      bool? three,
      bool? yesWithGoogleBusiness,
      bool? dontGoogleBusiness,
      bool? yesWithSelectImageSocialNetwork,
      bool? selectImageSocialNetwork,
      String? message,
      PostApiStatus? postApiStatus}) {
    return EditProfileBusinessOwnerStates(
        date: date ?? this.date,
        notes: notes ?? this.notes,
        yes: yes ?? this.yes,
        no: no ?? this.no,
        yes1: yes1 ?? this.yes1,
        yes2: yes2 ?? this.yes2,
        no1: no1 ?? this.no1,
        no2: no2 ?? this.no2,
        yes3: yes3 ?? this.yes3,
        no3: no3 ?? this.no3,
        yesWithGoogleBusiness:
            yesWithGoogleBusiness ?? this.yesWithGoogleBusiness,
        dontGoogleBusiness: dontGoogleBusiness ?? this.dontGoogleBusiness,
        yesWithSelectImageSocialNetwork: yesWithSelectImageSocialNetwork ??
            this.yesWithSelectImageSocialNetwork,
        selectImageSocialNetwork:
            selectImageSocialNetwork ?? this.selectImageSocialNetwork,
        zero: zero ?? this.zero,
        one: one ?? this.one,
        two: two ?? this.two,
        three: three ?? this.three,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [
        date,
        notes,
        yes,
        yes1,
        yes2,
        yes3,
        no,
        no1,
        no2,
        no3,
        zero,
        one,
        two,
        three,
        yesWithGoogleBusiness,
        dontGoogleBusiness,
        yesWithSelectImageSocialNetwork,
        selectImageSocialNetwork,
        message,
        postApiStatus
      ];
}
