part of 'edit_profile_bloc.dart';

class EditProfileStates extends Equatable {
  final File? file;
  final PlatformFile? platformFile;
  final String name;
  final String phone;
  final String date;
  final bool male;
  final bool female;
  final bool mexican;
  final bool foreigner;
  final bool puerto;
  final bool cabo;
  final bool bahia;
  final bool basic;
  final bool upperMiddle;
  final bool superior;
  final bool postgrado;
  final bool nulo;
  final bool basic1;
  final bool intermediate;
  final bool advanced;
  final bool yes;
  final bool no;
  final bool yes1;
  final bool no1;
  final bool yes2;
  final bool no2;
  final bool administrative;
  final bool customerSupport;
  final bool construction;
  final bool gastronomy;
  final bool maintenance;
  final bool health;
  final bool security;
  final bool services;
  final bool tecnology;
  final bool sales;
  final bool others;
  final String message;
  final PostApiStatus postApiStatus;

  const EditProfileStates(
      {this.file,
      this.platformFile,
      this.name = '',
      this.phone = '',
      this.date = '',
      this.male = false,
      this.female = false,
      this.mexican = false,
      this.foreigner = false,
      this.basic = false,
      this.upperMiddle = false,
      this.advanced = false,
      this.superior = false,
      this.intermediate = false,
      this.basic1 = false,
      this.nulo = false,
      this.puerto = false,
      this.cabo = false,
      this.bahia = false,
      this.postgrado = false,
      this.yes = false,
      this.no = false,
      this.yes1 = false,
      this.no1 = false,
      this.yes2 = false,
      this.no2 = false,
      this.administrative = false,
      this.construction = false,
      this.customerSupport = false,
      this.gastronomy = false,
      this.health = false,
      this.maintenance = false,
      this.sales = false,
      this.security = false,
      this.services = false,
      this.tecnology = false,
      this.others = false,
      this.message = '',
      this.postApiStatus = PostApiStatus.initial});

  EditProfileStates copyWith(
      {File? file,
      PlatformFile? platformFile,
      String? name,
      String? phone,
      String? date,
      bool? male,
      bool? female,
      bool? mexican,
      bool? foreigner,
      bool? puerto,
      bool? cabo,
      bool? bahia,
      bool? basic,
      bool? upperMiddle,
      bool? superior,
      bool? postgrado,
      bool? nulo,
      bool? basic1,
      bool? intermediate,
      bool? advanced,
      bool? yes,
      bool? no,
      bool? yes1,
      bool? no1,
      bool? yes2,
      bool? no2,
      bool? administrative,
      bool? customerSupport,
      bool? construction,
      bool? gastronomy,
      bool? maintenance,
      bool? health,
      bool? security,
      bool? services,
      bool? tecnology,
      bool? sales,
      bool? others,
      String? message,
      PostApiStatus? postApiStatus}) {
    return EditProfileStates(
        file: file ?? file,
        platformFile: platformFile ?? platformFile,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        date: date ?? this.date,
        male: male ?? this.male,
        female: female ?? this.female,
        mexican: mexican ?? this.mexican,
        foreigner: foreigner ?? this.foreigner,
        basic: basic ?? this.basic,
        upperMiddle: upperMiddle ?? this.upperMiddle,
        superior: superior ?? this.superior,
        intermediate: intermediate ?? this.intermediate,
        postgrado: postgrado ?? this.postgrado,
        puerto: puerto ?? this.puerto,
        cabo: cabo ?? this.cabo,
        bahia: bahia ?? this.bahia,
        basic1: basic1 ?? this.basic1,
        nulo: nulo ?? this.nulo,
        yes: yes ?? this.yes,
        no: no ?? this.no,
        yes1: yes1 ?? this.yes1,
        yes2: yes2 ?? this.yes2,
        no1: no1 ?? this.no1,
        no2: no2 ?? this.no2,
        administrative: administrative ?? this.administrative,
        advanced: advanced ?? this.advanced,
        construction: construction ?? this.construction,
        customerSupport: customerSupport ?? this.customerSupport,
        gastronomy: gastronomy ?? this.gastronomy,
        health: health ?? this.health,
        maintenance: maintenance ?? this.maintenance,
        sales: sales ?? this.sales,
        security: security ?? this.security,
        services: services ?? this.services,
        tecnology: tecnology ?? this.tecnology,
        others: others ?? this.others,
        message: message ?? this.message,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [
        file,
        platformFile,
        name,
        phone,
        date,
        male,
        female,
        mexican,
        foreigner,
        basic,
        puerto,
        cabo,
        bahia,
        upperMiddle,
        postgrado,
        intermediate,
        nulo,
        superior,
        basic1,
        yes,
        yes1,
        yes2,
        no,
        no1,
        no2,
        administrative,
        maintenance,
        sales,
        security,
        services,
        advanced,
        others,
        customerSupport,
        construction,
        tecnology,
        gastronomy,
        health,
        message,
        postApiStatus
      ];
}
