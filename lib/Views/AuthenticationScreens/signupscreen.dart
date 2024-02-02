import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import 'package:animate_do/animate_do.dart';
import '../../Widgets/customtextfield.dart';
import '../../Utils/no_connection_page.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Bloc/bloc/connectivity_bloc.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:itienda/Views/AuthenticationScreens/login.dart';

// ignore_for_file: unused_local_variable

// ignore_for_file: use_build_context_synchronously

class CheckConnectivitySignUp extends StatelessWidget {
  const CheckConnectivitySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return const SignUpScreen();
        } else if (state is DisConnectedState) {
          return const NoConnectionPage();
        } else {
          return Container();
        }
      },
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // controllers
  late final TextEditingController firstNameController;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  // global keys
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordFieldKey =
      GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> firstNameFieldKey =
      GlobalKey<FormFieldState>();

  // show password icon control provider
  ValueNotifier<bool> passwordobsureText = ValueNotifier<bool>(true);

  // colors for fields
  Color firstNameColor = Colors.black26;
  Color lastNameColor = Colors.black26;
  Color phoneNumberColor = Colors.black26;
  Color emailColor = Colors.black26;
  Color passwordColor = Colors.black26;
  Color confirmPasswordColor = Colors.black26;
  Color eyeColor = Colors.black26;
  Color eyeColor1 = Colors.black26;

  static String storeToken = "";

  _tokenRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storeToken = prefs.getString('token') ?? '';

    log("Get Token in RegisterScreen: $storeToken");
  }

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _tokenRetriever();
  }

// dispose method
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    AuthViewModal authViewModal = Provider.of<AuthViewModal>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // scaffold
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<AuthViewModal>(
          builder: (context, value, child) => SingleChildScrollView(
              child: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/back.png"),
                    alignment: Alignment.bottomRight),
              ),
              child: Form(
                key: key,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.06),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1000),
                            duration: const Duration(milliseconds: 1000),
                            child: RichText(
                                text: const TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text: "Regístrate ",
                                  style: TextStyle(
                                      color: AppColors.textLoginColor,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28)),
                              TextSpan(
                                text: "gratis",
                                style: TextStyle(
                                    color: AppColors.regisgerColor,
                                    fontSize: 28,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w900),
                              )
                            ])),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1200),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * .04,
                              child: const Center(
                                child: Text(
                                  "Deja que tu próximo",
                                  style: TextStyle(
                                    color: AppColors.textBlackColor,
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1400),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * .035,
                              child: const Center(
                                child: Text(
                                  "empleador te encuentre.",
                                  style: TextStyle(
                                    color: AppColors.textBlackColor,
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        // first name text field
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1600),
                            duration: const Duration(milliseconds: 1000),
                            child: CustomTextField(
                              textCapitalization: TextCapitalization.words,
                              onTap: () {
                                // setState(() {
                                //   firstNameColor = const Color(0xFFca8e2e);
                                //   lastNameColor = Colors.black26;
                                //   phoneNumberColor = Colors.black26;
                                //   emailColor = Colors.black26;
                                //   passwordColor = Colors.black26;
                                //   confirmPasswordColor = Colors.black26;
                                //   eyeColor = Colors.black26;
                                //   eyeColor1 = Colors.black26;
                                // });
                              },
                              validate: (value) {
                                return FieldValidator.validateName(
                                    value.toString());
                              },
                              controller: firstNameController,
                              fieldValidationkey: firstNameFieldKey,
                              hintText: "Nombre Completo",
                              textInputType: TextInputType.name,
                              inputAction: TextInputAction.next,
                              onChanged: (value) {
                                firstNameFieldKey.currentState!.validate();
                              },
                            ),
                          ),
                        ),

                        // space
                        SizedBox(
                          height: height * .02,
                        ),
                        // email text field
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1800),
                            duration: const Duration(milliseconds: 1000),
                            child: CustomTextField(
                              onTap: () {},
                              validate: (value) {
                                return FieldValidator.validateEmail(
                                    value.toString());
                              },
                              controller: emailController,
                              fieldValidationkey: emailFieldKey,
                              hintText: "Correo Electrónico",
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              onChanged: (value) {
                                emailFieldKey.currentState!.validate();
                              },
                            ),
                          ),
                        ),
                        // space
                        SizedBox(
                          height: height * .02,
                        ),
                        // password text field
                        ValueListenableBuilder(
                          valueListenable: passwordobsureText,
                          builder: (context, value, child) => Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 2000),
                              duration: const Duration(milliseconds: 1000),
                              child: CustomTextField(
                                onTap: () {},
                                character: '*',
                                onChanged: (value) {
                                  passwordFieldKey.currentState!.validate();
                                },
                                controller: passwordController,
                                fieldValidationkey: passwordFieldKey,
                                hintText: "Contraseña",
                                textInputType: TextInputType.visiblePassword,
                                validate: (value) {
                                  return FieldValidator.validatePassword(
                                      value.toString());
                                },
                                obscureText: passwordobsureText.value,
                                sufixIcon: InkWell(
                                  onTap: () {
                                    passwordobsureText.value =
                                        !passwordobsureText.value;
                                  },
                                  child: Icon(
                                      passwordobsureText.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility,
                                      color: const Color(0xFF766B6B)),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // space
                        SizedBox(
                          height: height * .05,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2200),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * .03,
                              child: Center(
                                  child: profileScreenText(
                                      "Al registrarte aceptas nuestros términos, política",
                                      14,
                                      12,
                                      14)),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2400),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * .028,
                              child: Center(
                                  child: profileScreenText(
                                      "de privacidad y política de cookies.",
                                      14,
                                      12,
                                      14)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        // sign up button
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2000),
                            duration: const Duration(milliseconds: 1000),
                            child: CustomButton(
                              loading: authViewModal.signinLoading,
                              width: width,
                              height: height * 0.07,
                              press: () async {
                                if (key.currentState!.validate()) {
                                  Map data = {
                                    'first_name':
                                        firstNameController.text.trim(),
                                    'email': emailController.text.trim(),
                                    'password': passwordController.text.trim(),
                                    'device_token': storeToken,
                                  };
                                  authViewModal.registerApi(data, context);
                                }
                              },
                              title: "Registrarme",
                              color: AppColors.buttonColor,
                            ),
                          ),
                        ),
                        // space
                        SizedBox(
                          height: height * .03,
                        ),
                        FadeInUp(
                            delay: const Duration(milliseconds: 2200),
                            duration: const Duration(milliseconds: 1000),
                            child: const Divider()),
                        SizedBox(
                          height: height * .01,
                        ),
                        // have already account text
                        FadeInUp(
                          delay: const Duration(milliseconds: 2400),
                          duration: const Duration(milliseconds: 1000),
                          child: SizedBox(
                            height: height * .04,
                            child: RichText(
                                text: TextSpan(children: <InlineSpan>[
                              const TextSpan(
                                  text: "¿Ya estás registrado? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontSize: 16)),
                              TextSpan(
                                  text: "Acceder",
                                  style: const TextStyle(
                                      color: AppColors.regisgerColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckConnectivityLogin(),
                                          ),
                                          (route) => false);
                                    })
                            ])),
                          ),
                        ),
                        // space
                      ]),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
