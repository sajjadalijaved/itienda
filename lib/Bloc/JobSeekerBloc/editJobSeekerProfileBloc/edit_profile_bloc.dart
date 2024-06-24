import 'dart:io';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:itienda/Utils/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'edit_profile_events.dart';
part 'edit_profile_states.dart';

class EditProfileBloc extends Bloc<EditProfileEvents, EditProfileStates> {
  EditProfileBloc() : super(const EditProfileStates()) {
    on<NameChangeEvent>(_nameChangeHandle);
    on<PhoneNumberChangeEvent>(_phoneChangeHandle);
    on<DateChangeEvent>(_dateChangeHandle);
    on<MaleBoxEvent>(_maleBoxHandle);
    on<FeMaleBoxEvent>(_feMaleBoxHandle);
    on<MexicanBoxEvent>(_mexicanBoxHandle);
    on<ForignorBoxEvent>(_forignorBoxHandle);
    on<PuertoBoxEvent>(_puertoBoxHandle);
    on<CaboBoxEvent>(_caboBoxHandle);
    on<BahiaBoxEvent>(_bahiaBoxHandle);
    on<BasicBoxEvent>(_basicBoxHandle);
    on<UpperMiddleBoxEvent>(_upperMiddleBoxHandle);
    on<SuperiorBoxEvent>(_superiorBoxHandle);
    on<PostgradoBoxEvent>(_postgradoBoxHandle);
    on<NuloBoxEvent>(_nuloBoxHandle);
    on<Basic1BoxEvent>(_basic1BoxHandle);
    on<IntermediateBoxEvent>(_intermediateBoxHandle);
    on<AdvanceBoxEvent>(_advanceBoxHandle);
    on<YesBoxEvent>(_yesBoxHandle);
    on<NoBoxEvent>(_noBoxHandle);
    on<Yes1BoxEvent>(_yes1BoxHandle);
    on<No1BoxEvent>(_no1BoxHandle);
    on<Yes2BoxEvent>(_yes2BoxHandle);
    on<No2BoxEvent>(_no2BoxHandle);
    on<AdministrativeBoxEvent>(_administrativeBoxHandle);
    on<CustomerSupportBoxEvent>(_customerSupportBoxHandle);
    on<ConstructionBoxEvent>(_constructionBoxHandle);
    on<GastronomyBoxEvent>(_gastronomyBoxHandle);
    on<MaintenanceBoxEvent>(_maintenanceBoxHandle);
    on<HealthBoxEvent>(_healthBoxHandle);
    on<SecurityBoxEvent>(_securityBoxHandle);
    on<ServicesBoxEvent>(_servicesBoxHandle);
    on<TecnologyBoxEvent>(_technologyBoxHandle);
    on<SalesBoxEvent>(_salesBoxHandle);
    on<OtherBoxEvent>(_otherBoxHandle);
    on<FilePickEvent>(filePickerHandle);
    on<EditProfileButtonEvent>(_editProfileButtonHandle);
  }

  void _nameChangeHandle(
      NameChangeEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(name: event.name),
    );
  }

  void _phoneChangeHandle(
      PhoneNumberChangeEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(phone: event.phone),
    );
  }

  void _dateChangeHandle(
      DateChangeEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(date: event.date),
    );
  }

  void _maleBoxHandle(MaleBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(male: !state.male),
    );
  }

  void _feMaleBoxHandle(FeMaleBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(female: !state.female),
    );
  }

  void _mexicanBoxHandle(
      MexicanBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(mexican: !state.mexican),
    );
  }

  void _forignorBoxHandle(
      ForignorBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(foreigner: !state.foreigner),
    );
  }

  void _basicBoxHandle(BasicBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(basic: !state.basic1),
    );
  }

  void _puertoBoxHandle(PuertoBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(puerto: !state.puerto),
    );
  }

  void _caboBoxHandle(CaboBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(cabo: !state.cabo),
    );
  }

  void _bahiaBoxHandle(BahiaBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(bahia: !state.bahia),
    );
  }

  void _upperMiddleBoxHandle(
      UpperMiddleBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(upperMiddle: !state.upperMiddle),
    );
  }

  void _superiorBoxHandle(
      SuperiorBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(superior: !state.superior),
    );
  }

  void _postgradoBoxHandle(
      PostgradoBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(postgrado: !state.postgrado),
    );
  }

  void _nuloBoxHandle(NuloBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(nulo: !state.nulo),
    );
  }

  void _basic1BoxHandle(Basic1BoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(basic1: !state.basic1),
    );
  }

  void _intermediateBoxHandle(
      IntermediateBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(intermediate: !state.intermediate),
    );
  }

  void _advanceBoxHandle(
      AdvanceBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(advanced: !state.advanced),
    );
  }

  void _yesBoxHandle(YesBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(yes: !state.yes),
    );
  }

  void _yes1BoxHandle(Yes1BoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(yes1: !state.yes1),
    );
  }

  void _yes2BoxHandle(Yes2BoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(yes2: !state.yes2),
    );
  }

  void _noBoxHandle(NoBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(no: !state.no),
    );
  }

  void _no1BoxHandle(No1BoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(no1: !state.no1),
    );
  }

  void _no2BoxHandle(No2BoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(no2: !state.no2),
    );
  }

  void _administrativeBoxHandle(
      AdministrativeBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(administrative: !state.administrative),
    );
  }

  void _customerSupportBoxHandle(
      CustomerSupportBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(customerSupport: !state.customerSupport),
    );
  }

  void _constructionBoxHandle(
      ConstructionBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(construction: !state.construction),
    );
  }

  void _gastronomyBoxHandle(
      GastronomyBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(gastronomy: !state.gastronomy),
    );
  }

  void _maintenanceBoxHandle(
      MaintenanceBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(maintenance: !state.maintenance),
    );
  }

  void _healthBoxHandle(HealthBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(health: !state.health),
    );
  }

  void _securityBoxHandle(
      SecurityBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(security: !state.security),
    );
  }

  void _servicesBoxHandle(
      ServicesBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(services: !state.services),
    );
  }

  void _technologyBoxHandle(
      TecnologyBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(tecnology: !state.tecnology),
    );
  }

  void _salesBoxHandle(SalesBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(sales: !state.sales),
    );
  }

  void _otherBoxHandle(OtherBoxEvent event, Emitter<EditProfileStates> emit) {
    emit(
      state.copyWith(others: !state.others),
    );
  }

  void filePickerHandle(
      FilePickEvent event, Emitter<EditProfileStates> emit) async {
    try {
      final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf'],
      );

      if (file != null) {
        File selectedFile = File(file.files.single.path!);
        PlatformFile platformFile = file.files.first;

        emit(state.copyWith(
            file: selectedFile,
            platformFile: platformFile,
            postApiStatus: PostApiStatus.success));
      } else {
        emit(state.copyWith(
            message: "File selection cancelled",
            postApiStatus: PostApiStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          message: "File selection cancelled",
          postApiStatus: PostApiStatus.error));
      log("message: ${e.toString()}");
    }
  }

  void _editProfileButtonHandle(
      EditProfileButtonEvent event, Emitter<EditProfileStates> emit) async {
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
