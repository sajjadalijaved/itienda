import 'package:bloc/bloc.dart';
import 'package:itienda/Utils/enum.dart';
import 'package:equatable/equatable.dart';
part 'edit_profile_events.dart';
part 'edit_profile_states.dart';

class EditProfileBusinessOwnerBloc extends Bloc<EditProfileBusinessOwnerEvents,
    EditProfileBusinessOwnerStates> {
  EditProfileBusinessOwnerBloc()
      : super(const EditProfileBusinessOwnerStates()) {
    on<DateChangeBusinessOwnerEvent>(_dateChangeHandle);
    on<NotesChangeEvent>(_notesChangeHandle);
    on<YesBusinessOwnerBoxEvent>(_yesBoxHandle);
    on<NoBusinessOwnerBoxEvent>(_noBoxHandle);
    on<Yes1BusinessOwnerBoxEvent>(_yes1BoxHandle);
    on<No1BusinessOwnerBoxEvent>(_no1BoxHandle);
    on<Yes2BusinessOwnerBoxEvent>(_yes2BoxHandle);
    on<No2BusinessOwnerBoxEvent>(_no2BoxHandle);
    on<Yes3BoxEvent>(_yes3BoxHandle);
    on<No3BoxEvent>(_no3BoxHandle);
    on<YesWithGoogleBusinessBoxEvent>(_yesWithGoogleBusinessBoxHandle);
    on<DontGoogleBusinessBoxEvent>(_dontGoogleBusinessBoxHandle);
    on<ZeroBoxEvent>(_zeroBoxHandle);
    on<OneBoxEvent>(_oneBoxHandle);
    on<TwoBoxEvent>(_twoBoxHandle);
    on<ThreeBoxEvent>(_threeBoxHandle);
    on<SelectImageSocialNetworkBoxEvent>(_selectImageSocialNetworkBoxHandle);
    on<YesWithSelectImageSocialNetworkBoxEvent>(
        _yesWithSelectImageSocialNetworkBoxHandle);
    on<EditProfileBusinessOwnerButtonEvent>(
        _editProfileBusinessOwnerButtonHandle);
  }

  void _dateChangeHandle(DateChangeBusinessOwnerEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(date: event.date),
    );
  }

  void _notesChangeHandle(
      NotesChangeEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(notes: event.notes),
    );
  }

  void _yesBoxHandle(YesBusinessOwnerBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(yes: !state.yes),
    );
  }

  void _yes1BoxHandle(Yes1BusinessOwnerBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(yes1: !state.yes1),
    );
  }

  void _yes2BoxHandle(Yes2BusinessOwnerBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(yes2: !state.yes2),
    );
  }

  void _yes3BoxHandle(
      Yes3BoxEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(yes3: !state.yes3),
    );
  }

  void _noBoxHandle(NoBusinessOwnerBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(no: !state.no),
    );
  }

  void _no1BoxHandle(No1BusinessOwnerBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(no1: !state.no1),
    );
  }

  void _no2BoxHandle(No2BusinessOwnerBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(no2: !state.no2),
    );
  }

  void _no3BoxHandle(
      No3BoxEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(no3: !state.no3),
    );
  }

  void _yesWithGoogleBusinessBoxHandle(YesWithGoogleBusinessBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(yesWithGoogleBusiness: !state.yesWithGoogleBusiness),
    );
  }

  void _dontGoogleBusinessBoxHandle(DontGoogleBusinessBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(dontGoogleBusiness: !state.dontGoogleBusiness),
    );
  }

  void _selectImageSocialNetworkBoxHandle(
      SelectImageSocialNetworkBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(selectImageSocialNetwork: !state.selectImageSocialNetwork),
    );
  }

  void _yesWithSelectImageSocialNetworkBoxHandle(
      YesWithSelectImageSocialNetworkBoxEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(
          yesWithSelectImageSocialNetwork:
              !state.yesWithSelectImageSocialNetwork),
    );
  }

  void _zeroBoxHandle(
      ZeroBoxEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(zero: !state.zero),
    );
  }

  void _oneBoxHandle(
      OneBoxEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(one: !state.one),
    );
  }

  void _twoBoxHandle(
      TwoBoxEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(two: !state.two),
    );
  }

  void _threeBoxHandle(
      ThreeBoxEvent event, Emitter<EditProfileBusinessOwnerStates> emit) {
    emit(
      state.copyWith(three: !state.three),
    );
  }

  void _editProfileBusinessOwnerButtonHandle(
      EditProfileBusinessOwnerButtonEvent event,
      Emitter<EditProfileBusinessOwnerStates> emit) async {
    emit(
      state.copyWith(postApiStatus: PostApiStatus.loading),
    );
    await Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.success,
          message: "Data Submitt successfully"));
    });
  }
}
