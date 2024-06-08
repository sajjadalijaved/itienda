import 'dart:developer';
import '../../../Utils/enum.dart';
import '../../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Widgets/text_widget.dart';
import '../../../Utils/Validation/validation.dart';
import 'package:itienda/Widgets/custombutton.dart';
import 'package:itienda/Widgets/pick_file_widget.dart';
import '../../../config/componants/loading_widget.dart';
import 'package:itienda/Bloc/editProfileBloc/edit_profile_bloc.dart';
import 'package:itienda/Widgets/custom_textfield_for_edit_profile.dart';

// ignore_for_file: use_build_context_synchronously

class EditProfileScreenBusinessOwner extends StatefulWidget {
  const EditProfileScreenBusinessOwner({super.key});

  @override
  State<EditProfileScreenBusinessOwner> createState() =>
      _EditProfileScreenBusinessOwnerState();
}

class _EditProfileScreenBusinessOwnerState
    extends State<EditProfileScreenBusinessOwner> {
  String countryCode = '';
  bool showError = false;
  late TextEditingController phoneController;
  late EditProfileBloc editProfileBloc;

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> nameFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> phoneFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> dateFieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    editProfileBloc = EditProfileBloc();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    editProfileBloc.close();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => EditProfileBloc(),
      child: BlocListener<EditProfileBloc, EditProfileStates>(
        listenWhen: (previous, current) =>
            current.postApiStatus != previous.postApiStatus,
        listener: (context, state) {
          if (state.postApiStatus == PostApiStatus.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const LoadingWidget();
                });
          }
          if (state.postApiStatus == PostApiStatus.error) {
            Utils.errorMessageFlush(state.message, context);
            log("Edit profile:${state.message}");
          }
          if (state.postApiStatus == PostApiStatus.success) {
            log("Name:${state.name}");
            log("Phone Number:${state.phone}");
            log("Date:${state.date}");
            log("male:${state.male == true ? 'male' : 'female'}");
            Utils.successMessageFlush(state.message, context);
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.02,
              ),
              height: height,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/profile.jpg",
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: 40,
                    width: 106,
                    child: Image.asset(
                      "assets/itienda.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/11.png",
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Editar Perfil",
                        style: TextStyle(
                            color: AppColors.textWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Expanded(
                    child: Form(
                      key: key,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            color: AppColors.textWhiteColor,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                text("Fecha de Nacimiento", 12,
                                    fontWeight: FontWeight.w500),
                                BlocBuilder<EditProfileBloc, EditProfileStates>(
                                  buildWhen: (previous, current) =>
                                      current.date != previous.date,
                                  builder: (context, state) {
                                    return CustomTextFieldForEditProfile(
                                      fieldValidationkey: dateFieldKey,
                                      onChanged: (value) {
                                        context.read<EditProfileBloc>().add(
                                              DateChangeEvent(date: value),
                                            );
                                        dateFieldKey.currentState!.validate();
                                      },
                                      hint: "dd-mm-yyyy",
                                      inputAction: TextInputAction.done,
                                      textInputType: TextInputType.datetime,
                                      inputparameter: [DateInputFormatter()],
                                      validate: (value) {
                                        return FieldValidator.validateDate(
                                            value.toString());
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),

                                text(
                                    "¿Te Gustaría Reflejar la Misma Información de tu Página de Google Mi Negocio en iTIENDA México?",
                                    12,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: height * 0.04,
                                  child: BlocBuilder<EditProfileBloc,
                                      EditProfileStates>(
                                    builder: (context, state) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const MaleBoxEvent());
                                            },
                                            child: row(
                                                state.male,
                                                profileScreenText(
                                                    "Sí", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                          SizedBox(
                                            width: width * 0.16,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(
                                                    const FeMaleBoxEvent(),
                                                  );
                                            },
                                            child: row(
                                                state.female,
                                                profileScreenText(
                                                    "No tengo página en Google Mi Negocio",
                                                    12,
                                                    10,
                                                    12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                /// genero
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                text("Género", 12, fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: height * 0.04,
                                  child: BlocBuilder<EditProfileBloc,
                                      EditProfileStates>(
                                    builder: (context, state) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const MaleBoxEvent());
                                            },
                                            child: row(
                                                state.male,
                                                profileScreenText(
                                                    "Masculino", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                          SizedBox(
                                            width: width * 0.16,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(
                                                    const FeMaleBoxEvent(),
                                                  );
                                            },
                                            child: row(
                                                state.female,
                                                profileScreenText(
                                                    "Feminino", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                /// Nacionalidad
                                text("Nacionalidad", 12,
                                    fontWeight: FontWeight.w500),

                                SizedBox(
                                  height: height * 0.04,
                                  child: BlocBuilder<EditProfileBloc,
                                      EditProfileStates>(
                                    builder: (context, state) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(
                                                    const MexicanBoxEvent(),
                                                  );
                                            },
                                            child: row(
                                                state.mexican,
                                                profileScreenText(
                                                    "Mexicano(a)", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                          SizedBox(
                                            width: width * 0.131,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(
                                                      const ForignorBoxEvent());
                                            },
                                            child: row(
                                                state.foreigner,
                                                profileScreenText(
                                                    "Extranjero(a)", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                //// Municipio
                                profileScreenText(
                                    "Municipio de Residencia", 12, 12, 14,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: height * 0.08,
                                  child: Column(
                                    children: [
                                      BlocBuilder<EditProfileBloc,
                                          EditProfileStates>(
                                        builder: (context, state) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<EditProfileBloc>()
                                                        .add(
                                                            const PuertoBoxEvent());
                                                  },
                                                  child: row(
                                                      state.puerto,
                                                      profileScreenText(
                                                          "Puerto Vallarta,Jal.",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          12,
                                                          10,
                                                          12),
                                                      context),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.038,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const CaboBoxEvent());
                                                },
                                                child: row(
                                                    state.cabo,
                                                    FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: profileScreenText(
                                                          "Cabo Corrientes,Jal.",
                                                          12,
                                                          10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          12),
                                                    ),
                                                    context),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      BlocBuilder<EditProfileBloc,
                                          EditProfileStates>(
                                        builder: (context, state) {
                                          return GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const BahiaBoxEvent());
                                            },
                                            child: row(
                                                state.bahia,
                                                profileScreenText(
                                                    "Bahia Banderas, Nay.",
                                                    12,
                                                    10,
                                                    12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: height * 0.04,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                  child: text("Nivel de Estudios", 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: height * 0.10,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      BlocBuilder<EditProfileBloc,
                                          EditProfileStates>(
                                        builder: (context, state) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const BasicBoxEvent());
                                                },
                                                child: row(
                                                    state.basic,
                                                    profileScreenText(
                                                        "Básico", 12, 10, 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                              SizedBox(
                                                width: width * 0.21,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const UpperMiddleBoxEvent());
                                                },
                                                child: row(
                                                    state.upperMiddle,
                                                    profileScreenText(
                                                        "Medio Superior",
                                                        12,
                                                        10,
                                                        12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      BlocBuilder<EditProfileBloc,
                                          EditProfileStates>(
                                        builder: (context, state) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const SuperiorBoxEvent());
                                                },
                                                child: row(
                                                    state.superior,
                                                    profileScreenText(
                                                        "Superior", 12, 10, 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                              SizedBox(
                                                width: width * 0.19,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const PostgradoBoxEvent());
                                                },
                                                child: row(
                                                    state.postgrado,
                                                    profileScreenText(
                                                        "Postgrado", 12, 10, 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                // Nivel de Ingles
                                SizedBox(
                                    height: height * 0.022,
                                    child: text("Nivel de Inglés", 12,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: height * 0.08,
                                  child: Column(
                                    children: [
                                      BlocBuilder<EditProfileBloc,
                                          EditProfileStates>(
                                        builder: (context, state) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const NuloBoxEvent());
                                                },
                                                child: row(
                                                    state.nulo,
                                                    profileScreenText(
                                                        "Nulo", 12, 10, 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                              SizedBox(
                                                width: width * 0.248,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const Basic1BoxEvent());
                                                },
                                                child: row(
                                                    state.basic1,
                                                    profileScreenText(
                                                        "Básico", 12, 10, 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      BlocBuilder<EditProfileBloc,
                                          EditProfileStates>(
                                        builder: (context, state) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const IntermediateBoxEvent());
                                                },
                                                child: row(
                                                    state.intermediate,
                                                    profileScreenText(
                                                        "Intermedio",
                                                        12,
                                                        10,
                                                        12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                              SizedBox(
                                                width: width * 0.164,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<EditProfileBloc>()
                                                      .add(
                                                          const AdvanceBoxEvent());
                                                },
                                                child: row(
                                                    state.advanced,
                                                    profileScreenText(
                                                        "Avanzado", 12, 10, 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    context),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                // ¿Tienes domínio de otros idiomas?

                                SizedBox(
                                    height: height * 0.022,
                                    child: profileScreenText(
                                        "¿Tienes domínio de otros idiomas?",
                                        12,
                                        12,
                                        14,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: height * 0.04,
                                  child: BlocBuilder<EditProfileBloc,
                                      EditProfileStates>(
                                    builder: (context, state) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const YesBoxEvent());
                                            },
                                            child: row(
                                                state.yes,
                                                profileScreenText(
                                                    "Sí", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                          SizedBox(
                                            width: width * 0.29,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const NoBoxEvent());
                                            },
                                            child: row(
                                                state.no,
                                                profileScreenText(
                                                    "No", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                // PROFESIONAL

                                SizedBox(
                                    height: height * 0.03,
                                    child: text("PROFESIONAL", 18,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                    height: height * 0.03,
                                    width: width,
                                    child: profileScreenText(
                                        "¿Estás trabajando actualmente?",
                                        12,
                                        12,
                                        14,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: height * 0.04,
                                  child: BlocBuilder<EditProfileBloc,
                                      EditProfileStates>(
                                    builder: (context, state) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const Yes1BoxEvent());
                                            },
                                            child: row(
                                                state.yes1,
                                                profileScreenText(
                                                    "Sí", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                          SizedBox(
                                            width: width * 0.29,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const No1BoxEvent());
                                            },
                                            child: row(
                                                state.no1,
                                                profileScreenText(
                                                    "No", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: height * 0.022,
                                    child: profileScreenText(
                                        "¿Tienes disponibilidad para empezar de inmediato?",
                                        12,
                                        12,
                                        14,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: height * 0.04,
                                  child: BlocBuilder<EditProfileBloc,
                                      EditProfileStates>(
                                    builder: (context, state) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const Yes2BoxEvent());
                                            },
                                            child: row(
                                                state.yes2,
                                                profileScreenText(
                                                    "Sí", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                          SizedBox(
                                            width: width * 0.29,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<EditProfileBloc>()
                                                  .add(const No2BoxEvent());
                                            },
                                            child: row(
                                                state.no2,
                                                profileScreenText(
                                                    "No", 12, 10, 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                context),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                // ¿En cuales areas te gustaria actuar?Escoge hasta 3 opciones
                                SizedBox(
                                    height: height * 0.05,
                                    child: profileScreenText(
                                        "¿En cuales areas te gustaria actuar? Escoge hasta 3 opciones.",
                                        12,
                                        12,
                                        14,
                                        fontWeight: FontWeight.w500)),
                                Column(
                                  children: [
                                    BlocBuilder<EditProfileBloc,
                                        EditProfileStates>(
                                      builder: (context, state) {
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context.read<EditProfileBloc>().add(
                                                    const AdministrativeBoxEvent());
                                              },
                                              child: row(
                                                  state.administrative,
                                                  profileScreenText(
                                                      "Administrativo",
                                                      12,
                                                      10,
                                                      12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                            SizedBox(
                                              width: width * 0.12,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context.read<EditProfileBloc>().add(
                                                    const CustomerSupportBoxEvent());
                                              },
                                              child: row(
                                                  state.customerSupport,
                                                  profileScreenText(
                                                      "Atención al Cliente",
                                                      12,
                                                      10,
                                                      12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    BlocBuilder<EditProfileBloc,
                                        EditProfileStates>(
                                      builder: (context, state) {
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context.read<EditProfileBloc>().add(
                                                    const ConstructionBoxEvent());
                                              },
                                              child: row(
                                                  state.construction,
                                                  profileScreenText(
                                                      "Construcción",
                                                      12,
                                                      10,
                                                      12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                            SizedBox(
                                              width: width * 0.14,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context.read<EditProfileBloc>().add(
                                                    const GastronomyBoxEvent());
                                              },
                                              child: row(
                                                  state.gastronomy,
                                                  profileScreenText(
                                                      "Gastronomia", 12, 10, 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    BlocBuilder<EditProfileBloc,
                                        EditProfileStates>(
                                      builder: (context, state) {
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context.read<EditProfileBloc>().add(
                                                    const MaintenanceBoxEvent());
                                              },
                                              child: row(
                                                  state.maintenance,
                                                  profileScreenText(
                                                      "Mantenimiento",
                                                      12,
                                                      10,
                                                      12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                            SizedBox(
                                              width: width * 0.12,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<EditProfileBloc>()
                                                    .add(
                                                        const HealthBoxEvent());
                                              },
                                              child: row(
                                                  state.health,
                                                  profileScreenText(
                                                      "Salud", 12, 10, 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    BlocBuilder<EditProfileBloc,
                                        EditProfileStates>(
                                      builder: (context, state) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<EditProfileBloc>()
                                                    .add(
                                                        const SecurityBoxEvent());
                                              },
                                              child: row(
                                                  state.security,
                                                  profileScreenText(
                                                      "Seguridad", 12, 10, 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                            SizedBox(
                                              width: width * 0.194,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<EditProfileBloc>()
                                                    .add(
                                                        const ServicesBoxEvent());
                                              },
                                              child: row(
                                                  state.services,
                                                  profileScreenText(
                                                      "Servicios", 12, 10, 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    BlocBuilder<EditProfileBloc,
                                        EditProfileStates>(
                                      builder: (context, state) {
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<EditProfileBloc>()
                                                    .add(
                                                        const TecnologyBoxEvent());
                                              },
                                              child: row(
                                                  state.tecnology,
                                                  profileScreenText(
                                                      "Tecnología", 12, 10, 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                            SizedBox(
                                              width: width * 0.184,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<EditProfileBloc>()
                                                    .add(const SalesBoxEvent());
                                              },
                                              child: row(
                                                  state.sales,
                                                  profileScreenText(
                                                      "Ventas", 12, 10, 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  context),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    BlocBuilder<EditProfileBloc,
                                        EditProfileStates>(
                                      builder: (context, state) {
                                        return GestureDetector(
                                          onTap: () {
                                            context
                                                .read<EditProfileBloc>()
                                                .add(const OtherBoxEvent());
                                          },
                                          child: row(
                                              state.others,
                                              profileScreenText(
                                                  "Otros", 12, 10, 12,
                                                  fontWeight: FontWeight.w400),
                                              context),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),

                                /// Subir curriculum
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.020),
                                  child: SizedBox(
                                      height: height * 0.03,
                                      child: text("Subir curriculum", 14,
                                          fontWeight: FontWeight.w600)),
                                ),

                                /// file show widget
                                const FilePickerWidget(),

                                SizedBox(
                                  height: height * 0.05,
                                ),
                                BlocBuilder<EditProfileBloc, EditProfileStates>(
                                  buildWhen: (previous, current) =>
                                      current.postApiStatus !=
                                      previous.postApiStatus,
                                  builder: (context, state) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.08),
                                      child: CustomButton(
                                          width: width,
                                          height: height * 0.06,
                                          press: () {
                                            if (key.currentState!.validate() &&
                                                phoneController.text.length >=
                                                    10) {
                                              context.read<EditProfileBloc>().add(
                                                  const EditProfileButtonEvent());
                                            } else {
                                              setState(() {
                                                showError = true;
                                                Utils.toastMessage(
                                                    "Kindly fill the all required fields.");
                                              });
                                            }
                                          },
                                          color: AppColors.buttonColor,
                                          title: "Guardar"),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.13,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
