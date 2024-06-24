import 'dart:developer';
import '../../../Utils/enum.dart';
import '../../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Widgets/text_widget.dart';
import '../../../Utils/Validation/validation.dart';
import 'package:itienda/Widgets/custombutton.dart';
import '../../../config/componants/loading_widget.dart';
import 'package:itienda/Widgets/custom_textfield_for_edit_profile.dart';
import '../../Bloc/BusinessOwnerBloc/editBusinessOwnerProfileBloc/edit_profile_bloc.dart';

// ignore_for_file: use_build_context_synchronously

class EditProfileScreenBusinessOwner extends StatefulWidget {
  const EditProfileScreenBusinessOwner({super.key});

  @override
  State<EditProfileScreenBusinessOwner> createState() =>
      _EditProfileScreenBusinessOwnerState();
}

class _EditProfileScreenBusinessOwnerState
    extends State<EditProfileScreenBusinessOwner> {
  late EditProfileBusinessOwnerBloc editProfileBloc;

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> dateFieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    editProfileBloc = EditProfileBusinessOwnerBloc();
  }

  @override
  void dispose() {
    editProfileBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => EditProfileBusinessOwnerBloc(),
      child: BlocListener<EditProfileBusinessOwnerBloc,
          EditProfileBusinessOwnerStates>(
        listenWhen: (previous, current) =>
            current.postApiStatus != previous.postApiStatus,
        listener: (context, state) {
          if (state.postApiStatus == PostApiStatus.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const LoadingWidget();
                });
          } else {
            Navigator.of(context, rootNavigator: true).pop();
            if (state.postApiStatus == PostApiStatus.error) {
              Utils.errorMessageFlush(state.message, context);
              log("Edit Business Owner profile:${state.message}");
            } else if (state.postApiStatus == PostApiStatus.success) {
              Utils.successMessageFlush(state.message, context);
            }
          }
        },
        child: Scaffold(
          body: Container(
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
            child: SafeArea(
              child: Form(
                key: key,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 73,
                      width: 182,
                      child: Image.asset(
                        "assets/businessside.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Row(
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
                            "Editar Perfil de Mi Negocio",
                            style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        height: height,
                        margin: EdgeInsets.only(
                            right: width >= 744 ? width * 0.25 : 0),
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: text("Fecha", 12,
                                          fontWeight: FontWeight.w500),
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: BlocBuilder<
                                      EditProfileBusinessOwnerBloc,
                                      EditProfileBusinessOwnerStates>(
                                    buildWhen: (previous, current) =>
                                        current.date != previous.date,
                                    builder: (context, state) {
                                      return CustomTextFieldForEditProfile(
                                        fieldValidationkey: dateFieldKey,
                                        onChanged: (value) {
                                          context
                                              .read<
                                                  EditProfileBusinessOwnerBloc>()
                                              .add(
                                                DateChangeBusinessOwnerEvent(
                                                    date: value),
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
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.001,
                            ),

                            text(
                                "¿Te Gustaría Reflejar la Misma Información de tu Página de Google Mi Negocio en iTIENDA México?",
                                12,
                                fontWeight: FontWeight.w600),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(
                                                const YesWithGoogleBusinessBoxEvent());
                                      },
                                      child: row(
                                          state.yesWithGoogleBusiness,
                                          profileScreenText("Sí", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(
                                              const DontGoogleBusinessBoxEvent(),
                                            );
                                      },
                                      child: row(
                                          state.dontGoogleBusiness,
                                          profileScreenText(
                                              "No tengo página en Google Mi Negocio",
                                              12,
                                              10,
                                              12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ),
                                  ],
                                );
                              },
                            ),

                            /// genero
                            SizedBox(
                              height: height * 0.02,
                            ),
                            text(
                                "¿Te gustaría promover algún evento de tu negocio?",
                                12,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: height * 0.04,
                              child: BlocBuilder<EditProfileBusinessOwnerBloc,
                                  EditProfileBusinessOwnerStates>(
                                builder: (context, state) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<
                                                  EditProfileBusinessOwnerBloc>()
                                              .add(
                                                  const YesBusinessOwnerBoxEvent());
                                        },
                                        child: row(
                                            state.yes,
                                            profileScreenText("Sí", 12, 10, 12,
                                                fontWeight: FontWeight.w400),
                                            context),
                                      ),
                                      SizedBox(
                                        width: width * 0.30,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<
                                                  EditProfileBusinessOwnerBloc>()
                                              .add(
                                                const NoBusinessOwnerBoxEvent(),
                                              );
                                        },
                                        child: row(
                                            state.no,
                                            profileScreenText("No", 12, 10, 12,
                                                fontWeight: FontWeight.w400),
                                            context),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            text(
                                "Por ejemplo, días de promociones y descuentos.",
                                11,
                                fontWeight: FontWeight.w300),

                            /// Nacionalidad
                            text(
                                "¿Cuantas vacantes de empleo te gustaría anunciar?",
                                12,
                                fontWeight: FontWeight.w600),

                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<
                                                    EditProfileBusinessOwnerBloc>()
                                                .add(
                                                  const ZeroBoxEvent(),
                                                );
                                          },
                                          child: row(
                                              state.zero,
                                              profileScreenText("0", 12, 10, 12,
                                                  fontWeight: FontWeight.w400),
                                              context),
                                        ),
                                        SizedBox(
                                          width: width * 0.30,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<
                                                    EditProfileBusinessOwnerBloc>()
                                                .add(const OneBoxEvent());
                                          },
                                          child: row(
                                              state.one,
                                              profileScreenText("1", 12, 10, 12,
                                                  fontWeight: FontWeight.w400),
                                              context),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<
                                                    EditProfileBusinessOwnerBloc>()
                                                .add(
                                                  const TwoBoxEvent(),
                                                );
                                          },
                                          child: row(
                                              state.two,
                                              profileScreenText("2", 12, 10, 12,
                                                  fontWeight: FontWeight.w400),
                                              context),
                                        ),
                                        SizedBox(
                                          width: width * 0.30,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<
                                                    EditProfileBusinessOwnerBloc>()
                                                .add(const ThreeBoxEvent());
                                          },
                                          child: row(
                                              state.three,
                                              profileScreenText(
                                                  "3+", 12, 10, 12,
                                                  fontWeight: FontWeight.w400),
                                              context),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),

                            //// Municipio
                            profileScreenText(
                                "Redes Sociales de tu Negocio", 16, 16, 16,
                                fontWeight: FontWeight.w600),
                            const Divider(
                              color: Color(0xFF22452F),
                              height: 1,
                            ),
                            profileScreenText(
                                "Tus redes sociales estarán expuestas en tu página de iTIENDA, generando así aún más visibilidad para tu negocio.",
                                11,
                                11,
                                11,
                                fontWeight: FontWeight.w300),
                            profileScreenText(
                                "¿Tu Negocio Tiene Perfiles en las Redes Sociales? *",
                                12,
                                12,
                                12,
                                fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 5,
                            ),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<
                                                  EditProfileBusinessOwnerBloc>()
                                              .add(
                                                  const Yes1BusinessOwnerBoxEvent());
                                        },
                                        child: row(
                                            state.yes1,
                                            profileScreenText(
                                                "Sí",
                                                fontWeight: FontWeight.w400,
                                                12,
                                                10,
                                                12),
                                            context),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(
                                                const No1BusinessOwnerBoxEvent());
                                      },
                                      child: row(
                                          state.no1,
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: profileScreenText(
                                                "No",
                                                12,
                                                10,
                                                fontWeight: FontWeight.w400,
                                                12),
                                          ),
                                          context),
                                    ),
                                  ],
                                );
                              },
                            ),

                            SizedBox(
                              height: height * 0.002,
                            ),
                            text(
                                "¿Te gustaría seleccionar tus propias imágenes para tu página en iTIENDA México?",
                                12,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<EditProfileBusinessOwnerBloc>()
                                        .add(
                                            const YesWithSelectImageSocialNetworkBoxEvent());
                                  },
                                  child: row(
                                      state.yesWithSelectImageSocialNetwork,
                                      profileScreenText("Sí", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<EditProfileBusinessOwnerBloc>()
                                        .add(
                                            const SelectImageSocialNetworkBoxEvent());
                                  },
                                  child: row(
                                      state.selectImageSocialNetwork,
                                      Expanded(
                                        child: profileScreenText(
                                            "No, por favor selecciona imágenes de mis redes sociales",
                                            12,
                                            10,
                                            12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      context),
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),

                            text("Te Gustaría Recibir un Código QR en Color? *",
                                12,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(
                                                const Yes2BusinessOwnerBoxEvent());
                                      },
                                      child: row(
                                          state.yes2,
                                          profileScreenText("Sí", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ),
                                    SizedBox(
                                      width: width * 0.30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(
                                                const No2BusinessOwnerBoxEvent());
                                      },
                                      child: row(
                                          state.no2,
                                          profileScreenText("No", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ),
                                  ],
                                );
                              },
                            ),

                            profileScreenText(
                                "Con el Código QR Puedes Generar Trafico a tu Página en iTIENDA Mexico",
                                11,
                                11,
                                11,
                                fontWeight: FontWeight.w300),

                            text(
                                "Yo Autorizo que Reflejen las Calificaciones en Línea de mi Negocio en Mi página de iTIENDA México. *",
                                12,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(const Yes3BoxEvent());
                                      },
                                      child: row(
                                          state.yes3,
                                          profileScreenText("Sí", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ),
                                    SizedBox(
                                      width: width * 0.30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<
                                                EditProfileBusinessOwnerBloc>()
                                            .add(const No3BoxEvent());
                                      },
                                      child: row(
                                          state.no3,
                                          profileScreenText("No", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            text("Notas", 12, fontWeight: FontWeight.w600),

                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
                              buildWhen: (previous, current) =>
                                  current.notes != previous.notes,
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.only(right: width * 0.20),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      context
                                          .read<EditProfileBusinessOwnerBloc>()
                                          .add(NotesChangeEvent(notes: value));
                                    },
                                    maxLines: 2,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFF365830),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(
                              height: height * 0.05,
                            ),
                            BlocBuilder<EditProfileBusinessOwnerBloc,
                                EditProfileBusinessOwnerStates>(
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
                                        if (key.currentState!.validate()) {
                                          context
                                              .read<
                                                  EditProfileBusinessOwnerBloc>()
                                              .add(
                                                  const EditProfileBusinessOwnerButtonEvent());
                                        } else {
                                          Utils.toastMessage(
                                              "Kindly fill the all required fields.");
                                        }
                                      },
                                      color: AppColors.buttonColor,
                                      title: "Submit"),
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width >= 744 ? height * 0.16 : height * 0.13,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
