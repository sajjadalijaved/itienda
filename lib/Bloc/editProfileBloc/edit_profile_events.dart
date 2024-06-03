part of 'edit_profile_bloc.dart';

abstract class EditProfileEvents extends Equatable {
  const EditProfileEvents();
  @override
  List<Object> get props => [];
}

class NameChangeEvent extends EditProfileEvents {
  final String name;
  const NameChangeEvent({required this.name});
  @override
  List<Object> get props => [name];
}

class PhoneNumberChangeEvent extends EditProfileEvents {
  final String phone;
  const PhoneNumberChangeEvent({required this.phone});
  @override
  List<Object> get props => [phone];
}

class DateChangeEvent extends EditProfileEvents {
  final String date;
  const DateChangeEvent({required this.date});
  @override
  List<Object> get props => [date];
}

class MaleBoxEvent extends EditProfileEvents {
  const MaleBoxEvent();
}

class FeMaleBoxEvent extends EditProfileEvents {
  const FeMaleBoxEvent();
}

class MexicanBoxEvent extends EditProfileEvents {
  const MexicanBoxEvent();
}

class ForignorBoxEvent extends EditProfileEvents {
  const ForignorBoxEvent();
}

class PuertoBoxEvent extends EditProfileEvents {
  const PuertoBoxEvent();
}

class CaboBoxEvent extends EditProfileEvents {
  const CaboBoxEvent();
}

class BahiaBoxEvent extends EditProfileEvents {
  const BahiaBoxEvent();
}

class BasicBoxEvent extends EditProfileEvents {
  const BasicBoxEvent();
}

class UpperMiddleBoxEvent extends EditProfileEvents {
  const UpperMiddleBoxEvent();
}

class SuperiorBoxEvent extends EditProfileEvents {
  const SuperiorBoxEvent();
}

class PostgradoBoxEvent extends EditProfileEvents {
  const PostgradoBoxEvent();
}

class NuloBoxEvent extends EditProfileEvents {
  const NuloBoxEvent();
}

class Basic1BoxEvent extends EditProfileEvents {
  const Basic1BoxEvent();
}

class IntermediateBoxEvent extends EditProfileEvents {
  const IntermediateBoxEvent();
}

class AdvanceBoxEvent extends EditProfileEvents {
  const AdvanceBoxEvent();
}

class YesBoxEvent extends EditProfileEvents {
  const YesBoxEvent();
}

class NoBoxEvent extends EditProfileEvents {
  const NoBoxEvent();
}

class Yes1BoxEvent extends EditProfileEvents {
  const Yes1BoxEvent();
}

class No1BoxEvent extends EditProfileEvents {
  const No1BoxEvent();
}

class Yes2BoxEvent extends EditProfileEvents {
  const Yes2BoxEvent();
}

class No2BoxEvent extends EditProfileEvents {
  const No2BoxEvent();
}

class AdministrativeBoxEvent extends EditProfileEvents {
  const AdministrativeBoxEvent();
}

class CustomerSupportBoxEvent extends EditProfileEvents {
  const CustomerSupportBoxEvent();
}

class ConstructionBoxEvent extends EditProfileEvents {
  const ConstructionBoxEvent();
}

class GastronomyBoxEvent extends EditProfileEvents {
  const GastronomyBoxEvent();
}

class MaintenanceBoxEvent extends EditProfileEvents {
  const MaintenanceBoxEvent();
}

class HealthBoxEvent extends EditProfileEvents {
  const HealthBoxEvent();
}

class SecurityBoxEvent extends EditProfileEvents {
  const SecurityBoxEvent();
}

class ServicesBoxEvent extends EditProfileEvents {
  const ServicesBoxEvent();
}

class TecnologyBoxEvent extends EditProfileEvents {
  const TecnologyBoxEvent();
}

class SalesBoxEvent extends EditProfileEvents {
  const SalesBoxEvent();
}

class OtherBoxEvent extends EditProfileEvents {
  const OtherBoxEvent();
}

class FilePickEvent extends EditProfileEvents {
  const FilePickEvent();
}

class EditProfileButtonEvent extends EditProfileEvents {
  const EditProfileButtonEvent();
}
