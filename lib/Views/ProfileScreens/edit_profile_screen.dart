import 'dart:io';
import 'dart:developer';
import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Utils/utils.dart';
import '../../Utils/Validation/validation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:itienda/Widgets/custombutton.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:itienda/Widgets/pick_file_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:itienda/Widgets/custom_textfield_for_edit_profile.dart';

// ignore_for_file: use_build_context_synchronously

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String countryCode = '';
  bool showError = false;
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController dateController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> nameFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> phoneFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> dateFieldKey = GlobalKey<FormFieldState>();
  // show checkbox icon provider
  ValueNotifier<bool> mancheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> womancheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> mexicanocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> extranjerocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> puertocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> cabocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> bahiacheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> bsicocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> mediocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> superiorcheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> postgradocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> nulocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> bsicocheckbox1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> intermediocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> avanzadocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> sicheckbox1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> nocheckbox1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> sicheckbox2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> nocheckbox2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> sicheckbox3 = ValueNotifier<bool>(false);
  ValueNotifier<bool> nocheckbox3 = ValueNotifier<bool>(false);
  ValueNotifier<bool> administrativocheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> atencioncheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> construccioncheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> gastronomiacheckbox2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> mantenimientocheckbox3 = ValueNotifier<bool>(false);
  ValueNotifier<bool> saludcheckbox3 = ValueNotifier<bool>(false);
  ValueNotifier<bool> seguridadcheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> servicioscheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> tecnologiacheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> ventascheckbox = ValueNotifier<bool>(false);
  ValueNotifier<bool> otroscheckbox = ValueNotifier<bool>(false);

  File? newImage;
  XFile? image;
  String? tempImage;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
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
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/profile.png",
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: AppColors.textWhiteColor,
                      ),
                    ),
                    const Text(
                      "Volver",
                      style: TextStyle(
                          color: AppColors.textWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.textWhiteColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.01,
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     showBottomSheet();
                            //   },
                            //   child: Row(
                            //     children: [
                            //       tempImage != null
                            //           ? ClipOval(
                            //               child: Image.file(
                            //                 File(tempImage!),
                            //                 fit: BoxFit.fill,
                            //                 height: 40,
                            //                 width: 40,
                            //               ),
                            //             )
                            //           :
                            //           // profile picture
                            //           ClipOval(
                            //               child: Image.asset(
                            //                 ("assets/user.png"),
                            //                 height: 40,
                            //                 width: 40,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //       SizedBox(
                            //         width: width * 0.01,
                            //       ),
                            //       GestureDetector(
                            //         onTap: () => showBottomSheet,
                            //         child: FittedBox(
                            //           fit: BoxFit.contain,
                            //           child: text("Editar Perfil", 18,
                            //               fontWeight: FontWeight.w500),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),

                            text("PERSONAL", 18, fontWeight: FontWeight.w600),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            text("Nombre Completo", 12,
                                fontWeight: FontWeight.w500),
                            CustomTextFieldForEditProfile(
                              fieldValidationkey: nameFieldKey,
                              hint: "",
                              controller: nameController,
                              inputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              textInputType: TextInputType.name,
                              validate: (value) {
                                return FieldValidator.validateName(
                                    value.toString());
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            text("Teléfono", 12, fontWeight: FontWeight.w500),
                            SizedBox(
                              width: width,
                              child: IntlPhoneField(
                                key: phoneFieldKey,
                                controller: phoneController,
                                textInputAction: TextInputAction.next,
                                initialCountryCode: "MX",
                                onChanged: (value) {
                                  countryCode = value.completeNumber.toString();
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.completeNumber.isEmpty) {
                                    return 'Número de teléfono es requerido';
                                  }
                                  return null;
                                },
                                dropdownIconPosition: IconPosition.trailing,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  errorText:
                                      showError && phoneController.text.isEmpty
                                          ? 'Número de teléfono es requerido'
                                          : null,
                                  fillColor: const Color(0xFFFFFFFF),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF000000), width: 0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF000000), width: 0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 0.5,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF000000), width: 0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            text("Fecha de Nacimiento", 12,
                                fontWeight: FontWeight.w500),
                            CustomTextFieldForEditProfile(
                              fieldValidationkey: dateFieldKey,
                              onChanged: (value) {
                                dateFieldKey.currentState!.validate();
                              },
                              hint: "dd-mm-yyyy",
                              controller: dateController,
                              inputAction: TextInputAction.done,
                              textInputType: TextInputType.datetime,
                              inputparameter: [DateInputFormatter()],
                              validate: (value) {
                                return FieldValidator.validateDate(
                                    value.toString());
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),

                            /// genero
                            SizedBox(
                                height: height * 0.02,
                                child: text("Género", 12,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: height * 0.04,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  row(
                                      mancheckbox,
                                      profileScreenText("Masculino", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                  SizedBox(
                                    width: width * 0.16,
                                  ),
                                  row(
                                      womancheckbox,
                                      profileScreenText("Feminino", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                ],
                              ),
                            ),

                            /// Nacionalidad
                            SizedBox(
                                height: height * 0.02,
                                child: text("Nacionalidad", 12,
                                    fontWeight: FontWeight.w500)),

                            SizedBox(
                              height: height * 0.04,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  row(
                                      mexicanocheckbox,
                                      profileScreenText(
                                          "Mexicano(a)", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                  SizedBox(
                                    width: width * 0.131,
                                  ),
                                  row(
                                      extranjerocheckbox,
                                      profileScreenText(
                                          "Extranjero(a)", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                ],
                              ),
                            ),

                            //// Municipio
                            SizedBox(
                                height: height * 0.022,
                                child: profileScreenText(
                                    "Municipio de Residencia", 12, 12, 14,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: height * 0.08,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: row(
                                            puertocheckbox,
                                            profileScreenText(
                                                "Puerto Vallarta, Jal.",
                                                fontWeight: FontWeight.w400,
                                                12,
                                                10,
                                                12),
                                            context),
                                      ),
                                      SizedBox(
                                        width: width * 0.038,
                                      ),
                                      row(
                                          cabocheckbox,
                                          profileScreenText(
                                              "Cabo Corrientes, Jal.",
                                              12,
                                              10,
                                              fontWeight: FontWeight.w400,
                                              12),
                                          context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  row(
                                      bahiacheckbox,
                                      profileScreenText(
                                          "Bahia Banderas, Nay.", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                ],
                              ),
                            ),

                            ///Academico
                            SizedBox(
                                height: height * 0.028,
                                child: text("ACADÉMICO", 18,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: height * 0.004,
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(
                                          bsicocheckbox,
                                          profileScreenText(
                                              "Básico", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                      SizedBox(
                                        width: width * 0.21,
                                      ),
                                      row(
                                          mediocheckbox,
                                          profileScreenText(
                                              "Medio Superior", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(
                                          superiorcheckbox,
                                          profileScreenText(
                                              "Superior", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                      SizedBox(
                                        width: width * 0.19,
                                      ),
                                      row(
                                          postgradocheckbox,
                                          profileScreenText(
                                              "Postgrado", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ],
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(
                                          nulocheckbox,
                                          profileScreenText("Nulo", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                      SizedBox(
                                        width: width * 0.248,
                                      ),
                                      row(
                                          bsicocheckbox1,
                                          profileScreenText(
                                              "Básico", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(
                                          intermediocheckbox,
                                          profileScreenText(
                                              "Intermedio", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                      SizedBox(
                                        width: width * 0.164,
                                      ),
                                      row(
                                          avanzadocheckbox,
                                          profileScreenText(
                                              "Avanzado", 12, 10, 12,
                                              fontWeight: FontWeight.w400),
                                          context),
                                    ],
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  row(
                                      sicheckbox1,
                                      profileScreenText("Sí", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                  SizedBox(
                                    width: width * 0.29,
                                  ),
                                  row(
                                      nocheckbox1,
                                      profileScreenText("No", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                ],
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  row(
                                      sicheckbox2,
                                      profileScreenText("Sí", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                  SizedBox(
                                    width: width * 0.29,
                                  ),
                                  row(
                                      nocheckbox2,
                                      profileScreenText("No", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                ],
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  row(
                                      sicheckbox3,
                                      profileScreenText("Sí", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                  SizedBox(
                                    width: width * 0.29,
                                  ),
                                  row(
                                      nocheckbox3,
                                      profileScreenText("No", 12, 10, 12,
                                          fontWeight: FontWeight.w400),
                                      context),
                                ],
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    row(
                                        administrativocheckbox,
                                        profileScreenText(
                                            "Administrativo", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                    SizedBox(
                                      width: width * 0.12,
                                    ),
                                    row(
                                        atencioncheckbox,
                                        profileScreenText(
                                            "Atención al Cliente", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    row(
                                        construccioncheckbox,
                                        profileScreenText(
                                            "Construcción", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                    SizedBox(
                                      width: width * 0.14,
                                    ),
                                    row(
                                        gastronomiacheckbox2,
                                        profileScreenText(
                                            "Gastronomia", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    row(
                                        mantenimientocheckbox3,
                                        profileScreenText(
                                            "Mantenimiento", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                    SizedBox(
                                      width: width * 0.12,
                                    ),
                                    row(
                                        saludcheckbox3,
                                        profileScreenText("Salud", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    row(
                                        seguridadcheckbox,
                                        profileScreenText(
                                            "Seguridad", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                    SizedBox(
                                      width: width * 0.194,
                                    ),
                                    row(
                                        servicioscheckbox,
                                        profileScreenText(
                                            "Servicios", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    row(
                                        tecnologiacheckbox,
                                        profileScreenText(
                                            "Tecnología", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                    SizedBox(
                                      width: width * 0.184,
                                    ),
                                    row(
                                        ventascheckbox,
                                        profileScreenText("Ventas", 12, 10, 12,
                                            fontWeight: FontWeight.w400),
                                        context),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                row(
                                    otroscheckbox,
                                    profileScreenText("Otros", 12, 10, 12,
                                        fontWeight: FontWeight.w400),
                                    context),
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

                            ///
                            const FilePickerWidget(),

                            SizedBox(
                              height: height * 0.05,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
                              child: CustomButton(
                                  width: width,
                                  height: height * 0.06,
                                  press: () {
                                    if (key.currentState!.validate() &&
                                        phoneController.text.length >= 10) {
                                      log("Phone Number:$countryCode}");
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
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // show bottom sheet for pick user profile picture
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .02,
              bottom: MediaQuery.of(context).size.height * .05),
          children: [
            // picture label
            const Text(
              "Please Pick Profile Picture",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // gallery pick image button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(MediaQuery.of(context).size.width * .3,
                            MediaQuery.of(context).size.height * .15)),
                    onPressed: () async {
                      image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image == null) return;

                      final dir = await path_provider.getTemporaryDirectory();
                      final targetPath = '${dir.absolute.path}/temp.jpg';
                      final result =
                          await FlutterImageCompress.compressAndGetFile(
                        image!.path,
                        targetPath,
                        minHeight: 1080,
                        minWidth: 1080,
                        quality: 90,
                      );
                      newImage = File(result!.path);
                      setState(() {
                        tempImage = image!.path;
                      });

                      // Apis.profilePictureUpdate(newImage!);

                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/image.png",
                      fit: BoxFit.fill,
                    )),
                // camera pick image button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: Size(MediaQuery.of(context).size.width * .3,
                            MediaQuery.of(context).size.height * .15)),
                    onPressed: () async {
                      image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      if (image == null) return;

                      final dir = await path_provider.getTemporaryDirectory();
                      final targetPath = '${dir.absolute.path}/temp.jpg';
                      final result =
                          await FlutterImageCompress.compressAndGetFile(
                        image!.path,
                        targetPath,
                        minHeight: 1080,
                        minWidth: 1080,
                        quality: 90,
                      );
                      newImage = File(result!.path);
                      setState(() {
                        tempImage = image!.path;
                      });

                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/camera.png",
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}
