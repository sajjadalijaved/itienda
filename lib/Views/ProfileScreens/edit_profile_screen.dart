import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import '../../Utils/Validation/validation.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:itienda/Widgets/custombutton.dart';
import 'package:itienda/Widgets/pick_file_widget.dart';
import 'package:itienda/Widgets/custom_textfield_for_edit_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: width * 0.06,
            right: width * 0.04,
            top: height * 0.03,
          ),
          height: height,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  "assets/back.png",
                ),
                alignment: Alignment.bottomRight,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.01),
                child: SizedBox(
                  height: height * 0.05,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      const Text(
                        "Regresar",
                        style: TextStyle(
                            color: AppColors.appbarTitleColor,
                            fontSize: 20,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.10,
                width: width * 0.6,
                child: Image.asset(
                  "assets/splash.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                child: Form(
                  key: key,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.04, right: width * 0.01),
                      margin: EdgeInsets.only(left: width * 0.02),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/pro.png"),
                            fit: BoxFit.cover),
                      ),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        cacheExtent: height,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: height * 0.14,
                                width: width * 0.14,
                                decoration: const BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/user.png"),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              text("Editar Perfil", 18,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          text("PERSONAL", 18, fontWeight: FontWeight.w500),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          text("Nombre Completo", 12,
                              fontWeight: FontWeight.w500),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.02),
                            child: CustomTextFieldForEditProfile(
                              height: height * 0.04,
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
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          text("Teléfono", 12, fontWeight: FontWeight.w600),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.15),
                            child: CustomTextFieldForEditProfile(
                              height: height * 0.04,
                              hint: "",
                              controller: phoneController,
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.phone,
                              validate: (value) {
                                return FieldValidator.validatePhoneNumber(
                                    value.toString());
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          text("Fecha de Nacimiento", 12,
                              fontWeight: FontWeight.w500),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.15),
                            child: CustomTextFieldForEditProfile(
                              height: height * 0.04,
                              hint: "dd-mm-yyyy",
                              controller: dateController,
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.datetime,
                              validate: (value) {
                                return FieldValidator.validatedate(
                                    value.toString());
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),

                          /// genero
                          SizedBox(
                              height: height * 0.02,
                              child: text("Género", 14,
                                  fontWeight: FontWeight.w500)),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.10),
                            child: SizedBox(
                              height: height * 0.04,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  row(mancheckbox, text("Masculino", 12),
                                      context),
                                  SizedBox(
                                    width: width * 0.16,
                                  ),
                                  row(womancheckbox, text("Feminino", 12),
                                      context),
                                ],
                              ),
                            ),
                          ),

                          /// Nacionalidad
                          SizedBox(
                              height: height * 0.02,
                              child: text("Nacionalidad", 14,
                                  fontWeight: FontWeight.w500)),

                          SizedBox(
                            height: height * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                row(mexicanocheckbox, text("Mexicano(a)", 12),
                                    context),
                                SizedBox(
                                  width: width * 0.131,
                                ),
                                row(extranjerocheckbox,
                                    text("Extranjero(a)", 12), context),
                              ],
                            ),
                          ),

                          //// Municipio
                          SizedBox(
                              height: height * 0.02,
                              child: text("Municipio de Residencia", 14,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: height * 0.08,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                  width: width,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: row(
                                          puertocheckbox,
                                          text("Puerto Vallarta, Jal.", 12),
                                          context),
                                    ),
                                    SizedBox(
                                      width: width * 0.038,
                                    ),
                                    row(
                                        cabocheckbox,
                                        text("Cabo Corrientes, Jal.", 12),
                                        context),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                row(bahiacheckbox,
                                    text("Bahia Banderas, Nay.", 12), context),
                              ],
                            ),
                          ),

                          ///Academico
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.016),
                            child: SizedBox(
                                height: height * 0.023,
                                child: text("ACADÉMICO", 18,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: height * 0.004,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.016),
                            child: SizedBox(
                              height: height * 0.02,
                              child: text("Nivel de Estudios", 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.016),
                            child: SizedBox(
                              height: height * 0.08,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(bsicocheckbox, text("Básico", 12),
                                          context),
                                      SizedBox(
                                        width: width * 0.21,
                                      ),
                                      row(mediocheckbox,
                                          text("Medio Superior", 12), context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(superiorcheckbox,
                                          text("Superior", 12), context),
                                      SizedBox(
                                        width: width * 0.19,
                                      ),
                                      row(postgradocheckbox,
                                          text("Postgrado", 12), context),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Nivel de Ingles
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.016),
                            child: SizedBox(
                                height: height * 0.03,
                                child: text("Nivel de Inglés", 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.016),
                            child: SizedBox(
                              height: height * 0.08,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(nulocheckbox, text("Nulo", 12),
                                          context),
                                      SizedBox(
                                        width: width * 0.248,
                                      ),
                                      row(bsicocheckbox1, text("Básico", 12),
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
                                      row(intermediocheckbox,
                                          text("Intermedio", 12), context),
                                      SizedBox(
                                        width: width * 0.164,
                                      ),
                                      row(avanzadocheckbox,
                                          text("Avanzado", 12), context),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // ¿Tienes domínio de otros idiomas?

                          Padding(
                            padding: EdgeInsets.only(left: width * 0.016),
                            child: SizedBox(
                                height: height * 0.02,
                                child: text(
                                    "¿Tienes domínio de otros idiomas?", 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: width * 0.020),
                              child: SizedBox(
                                height: height * 0.04,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    row(sicheckbox1, text("Sí", 12), context),
                                    SizedBox(
                                      width: width * 0.29,
                                    ),
                                    row(nocheckbox1, text("No", 12), context),
                                  ],
                                ),
                              ))

                          // PROFESIONAL
                          ,
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.020),
                            child: SizedBox(
                                height: height * 0.03,
                                child: text("PROFESIONAL", 18,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.020),
                            child: SizedBox(
                                height: height * 0.02,
                                child: text(
                                    "¿Estás trabajando actualmente?", 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: width * 0.020),
                              child: SizedBox(
                                height: height * 0.04,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    row(sicheckbox2, text("Sí", 12), context),
                                    SizedBox(
                                      width: width * 0.29,
                                    ),
                                    row(nocheckbox2, text("No", 12), context),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.020),
                            child: SizedBox(
                                height: height * 0.02,
                                child: text(
                                    "¿Tienes disponibilidad para empezar de inmediato?",
                                    14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: width * 0.020),
                              child: SizedBox(
                                height: height * 0.04,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    row(sicheckbox3, text("Sí", 12), context),
                                    SizedBox(
                                      width: width * 0.29,
                                    ),
                                    row(nocheckbox3, text("No", 12), context),
                                  ],
                                ),
                              )),
                          // ¿En cuales areas te gustaria actuar?Escoge hasta 3 opciones
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.020),
                            child: SizedBox(
                                height: height * 0.06,
                                child: text(
                                    "¿En cuales areas te gustaria actuar?      Escoge hasta 3 opciones",
                                    14,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: width * 0.020),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(administrativocheckbox,
                                          text("Administrativo", 12), context),
                                      SizedBox(
                                        width: width * 0.12,
                                      ),
                                      row(
                                          atencioncheckbox,
                                          text(
                                            "Atención al Cliente",
                                            12,
                                          ),
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
                                      row(construccioncheckbox,
                                          text("Construcción", 12), context),
                                      SizedBox(
                                        width: width * 0.14,
                                      ),
                                      row(gastronomiacheckbox2,
                                          text("Gastronomia", 12), context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      row(mantenimientocheckbox3,
                                          text("Mantenimiento", 12), context),
                                      SizedBox(
                                        width: width * 0.12,
                                      ),
                                      row(saludcheckbox3, text("Salud", 12),
                                          context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      row(seguridadcheckbox,
                                          text("Seguridad", 12), context),
                                      SizedBox(
                                        width: width * 0.194,
                                      ),
                                      row(servicioscheckbox,
                                          text("Servicios", 12), context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      row(tecnologiacheckbox,
                                          text("Tecnología", 12), context),
                                      SizedBox(
                                        width: width * 0.184,
                                      ),
                                      row(ventascheckbox, text("Ventas", 12),
                                          context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  row(otroscheckbox, text("Otros", 12),
                                      context),
                                ],
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),

                          /// Subir curriculum
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.020),
                            child: SizedBox(
                                height: height * 0.03,
                                child: text("Subir curriculum", 14,
                                    fontWeight: FontWeight.w500)),
                          ),

                          ///
                          const FilePickerWidget(),

                          SizedBox(
                            height: height * 0.05,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: CustomButton(
                                width: width,
                                height: height * 0.06,
                                press: () {
                                  if (key.currentState!.validate()) {}
                                },
                                color: AppColors.buttonColor,
                                title: "Guardar"),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
