import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import '../../Widgets/customtextfield.dart';
import '../../Utils/no_connection_page.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Bloc/bloc/connectivity_bloc.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final TextEditingController confirmPasswordController;

  // global keys
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> confirmPasswordFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> firstNameFieldKey =
      GlobalKey<FormFieldState>();

  // show password icon control provider
  ValueNotifier<bool> passwordobsureText = ValueNotifier<bool>(true);
  ValueNotifier<bool> confirmPasswordobsureText = ValueNotifier<bool>(true);

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
    confirmPasswordController = TextEditingController();
    _tokenRetriever();
  }

// dispose method
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    confirmPasswordController.dispose();

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
        body: Consumer<AuthViewModal>(
          builder: (context, value, child) => SingleChildScrollView(
              child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/back.png"), fit: BoxFit.cover),
                ),
                child: Form(
                  key: key,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: const TextSpan(children: <InlineSpan>[
                            TextSpan(
                                text: "Regístrate ",
                                style: TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28)),
                            TextSpan(
                              text: "gratis",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontSize: 30,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold),
                            )
                          ])),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Center(
                            child: Text(
                              "Deja que tu próximo",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "empleador te encuentre.",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          // first name text field
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: CustomTextField(
                              textCapitalization: TextCapitalization.words,
                              onTap: () {},
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

                          // space
                          SizedBox(
                            height: height * .02,
                          ),
                          // email text field
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
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
                          // space
                          SizedBox(
                            height: height * .02,
                          ),
                          // password text field
                          ValueListenableBuilder(
                            valueListenable: passwordobsureText,
                            builder: (context, value, child) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
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
                          SizedBox(
                            height: height * 0.02,
                          ),
                          // password confirm text field
                          ValueListenableBuilder(
                            valueListenable: confirmPasswordobsureText,
                            builder: (context, value, child) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
                              child: CustomTextField(
                                onTap: () {},
                                character: '*',
                                onChanged: (value) {
                                  confirmPasswordFieldKey.currentState!
                                      .validate();
                                },
                                controller: confirmPasswordController,
                                fieldValidationkey: confirmPasswordFieldKey,
                                hintText: "Repetir contraseña",
                                textInputType: TextInputType.visiblePassword,
                                validate: (value) {
                                  return FieldValidator.validatePasswordMatch(
                                      value.toString(),
                                      passwordController.text);
                                },
                                obscureText: confirmPasswordobsureText.value,
                                sufixIcon: InkWell(
                                  onTap: () {
                                    confirmPasswordobsureText.value =
                                        !confirmPasswordobsureText.value;
                                  },
                                  child: Icon(
                                      confirmPasswordobsureText.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility,
                                      color: const Color(0xFF766B6B)),
                                ),
                              ),
                            ),
                          ),

                          // space
                          SizedBox(
                            height: height * .03,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.09),
                            child: const Center(
                                child: Text(
                              textAlign: TextAlign.center,
                              "Al registrarte aceptas nuestros términos, política de privacidad y política de cookies.",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400),
                            )),
                          ),

                          SizedBox(
                            height: height * 0.03,
                          ),
                          // sign up button
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: CustomButton(
                              loading: authViewModal.signinLoading,
                              width: width,
                              height: height * 0.06,
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
                          SizedBox(
                            height: height * 0.04,
                          ),
                          // google login button
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.08,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/google.png",
                                  height: 35,
                                  width: 35,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Acceder con Google',
                                  style: TextStyle(
                                      color: AppColors.textWhiteColor,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          // facebook login button
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.08,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/facebook.png",
                                  height: 35,
                                  width: 35,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Acceder con Facebook',
                                  style: TextStyle(
                                      color: AppColors.textWhiteColor,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),

                          // space
                          SizedBox(
                            height: height * .03,
                          ),
                          const Divider(
                            color: AppColors.textWhiteColor,
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          // have already account text
                          SizedBox(
                            height: height * .04,
                            child: RichText(
                                text: TextSpan(children: <InlineSpan>[
                              const TextSpan(
                                  text: "¿Ya estás registrado? ",
                                  style: TextStyle(
                                      color: AppColors.textWhiteColor,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14)),
                              TextSpan(
                                  text: "Acceder",
                                  style: const TextStyle(
                                      color: AppColors.textWhiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                          // space
                        ]),
                  ),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
