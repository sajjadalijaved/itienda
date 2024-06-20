import 'dart:developer';
import '../main_screen.dart';
import '../../../Utils/enum.dart';
import '../../../Utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/custombutton.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../../Widgets/customtextfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Widgets/connectivity_check.dart';
import '../../../Utils/Validation/validation.dart';
import 'package:itienda/config/routes/routes_name.dart';
import '../../../config/componants/loading_widget.dart';
import '../../../config/localStorage/local_storage.dart';
import 'package:itienda/Bloc/signUpBloc/sign_up_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../businessOwner/main_screen_business_owner.dart';
import '../../../Bloc/loginBloc/googleLoginBloc/google_bloc.dart';
import 'package:itienda/Widgets/customRadioButton/radio_button.dart';
import 'package:itienda/Views/jobseeker/AuthenticationScreens/login.dart';

// ignore_for_file: unused_element

// ignore_for_file: use_build_context_synchronously

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpBloc signUpBloc;
  String token = '';
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  late LocalStorage localStorage;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // global keys
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> confirmPasswordFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> firstNameFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> businessNameFieldKey =
      GlobalKey<FormFieldState>();

  // get token
  Future<String> getToken() async {
    await firebaseMessaging.getToken().then((value) {
      if (value != null) {
        setState(() {
          token = value;
        });
        log('Push Token: $token');
      }
    });
    return token;
  }

  @override
  void initState() {
    super.initState();
    signUpBloc = SignUpBloc();
    localStorage = LocalStorage();
    getToken();
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const LoadingWidget(),
    );
  }

// dispose method
  @override
  void dispose() {
    signUpBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocListener<SignUpBloc, SignUpStates>(
        listenWhen: (previous, current) =>
            current.postApiStatus != previous.postApiStatus,
        listener: (context, state) async {
          if (state.postApiStatus == PostApiStatus.loading) {
            _showLoadingDialog(context);
          } else {
            bool isDialogShowing = ModalRoute.of(context)?.isCurrent == false;
            if (isDialogShowing) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            if (state.postApiStatus == PostApiStatus.error) {
              Utils.errorMessageFlush(state.message, context);
            } else if (state.postApiStatus == PostApiStatus.success) {
              await Navigator.of(context)
                  .pushReplacementNamed(RoutesName.loginScreen);
              Utils.successMessageFlush(state.message, context);
            }
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          // scaffold
          child: Scaffold(
              body: SafeArea(
            child: Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/back.png"), fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: RichText(
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
                          ),
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
                          // business name text field
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            builder: (context, state) {
                              return state.selectvalue == 2
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.08),
                                      child: CustomTextField(
                                        fieldValidationkey:
                                            businessNameFieldKey,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        hintText: "nombre de empresa",
                                        textInputType: TextInputType.name,
                                        inputAction: TextInputAction.next,
                                        validate: (value) {
                                          return FieldValidator
                                              .validateBusinessName(value);
                                        },
                                        onChanged: (value) {
                                          context.read<SignUpBloc>().add(
                                                BusinessNameSignUpChanged(
                                                  businessName: value,
                                                ),
                                              );
                                        },
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          ),

                          // space
                          SizedBox(
                            height: height * .02,
                          ),

                          // first name text field
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            buildWhen: (previous, current) =>
                                previous.name != current.name,
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.08),
                                child: CustomTextField(
                                  textCapitalization: TextCapitalization.words,
                                  validate: (value) {
                                    return FieldValidator.validateName(
                                        value.toString());
                                  },
                                  fieldValidationkey: firstNameFieldKey,
                                  hintText: "Nombre Completo",
                                  textInputType: TextInputType.name,
                                  inputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    context.read<SignUpBloc>().add(
                                          NameChanged(
                                            name: value,
                                          ),
                                        );
                                    firstNameFieldKey.currentState!.validate();
                                  },
                                ),
                              );
                            },
                          ),

                          // space
                          SizedBox(
                            height: height * .02,
                          ),
                          // email text field
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            buildWhen: (previous, current) =>
                                previous.email != current.email,
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.08),
                                child: CustomTextField(
                                  validate: (value) {
                                    return FieldValidator.validateEmail(
                                        value.toString());
                                  },
                                  fieldValidationkey: emailFieldKey,
                                  hintText: "Correo Electrónico",
                                  textInputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    context.read<SignUpBloc>().add(
                                          EmailSignUpChanged(email: value),
                                        );
                                    emailFieldKey.currentState!.validate();
                                  },
                                ),
                              );
                            },
                          ),
                          // space
                          SizedBox(
                            height: height * .02,
                          ),
                          // password text field
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            buildWhen: (previous, current) =>
                                previous.password != current.password,
                            builder: (context, state) {
                              return BlocBuilder<SignUpBloc, SignUpStates>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.08),
                                    child: CustomTextField(
                                        character: '*',
                                        onChanged: (value) {
                                          context.read<SignUpBloc>().add(
                                                PasswordSignUpChanged(
                                                    password: value),
                                              );
                                          passwordFieldKey.currentState!
                                              .validate();
                                        },
                                        fieldValidationkey: passwordFieldKey,
                                        hintText: "Contraseña",
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        validate: (value) {
                                          return FieldValidator
                                              .validatePassword(
                                                  value.toString());
                                        },
                                        obscureText: state.obsecure,
                                        sufixIcon: InkWell(
                                          onTap: () {
                                            context.read<SignUpBloc>().add(
                                                const PasswordVisibilitySignUp());
                                          },
                                          child: Icon(
                                              state.obsecure
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility,
                                              color: const Color(0xFF766B6B)),
                                        )),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          // password confirm text field
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            buildWhen: (previous, current) =>
                                previous.confirmPassword !=
                                current.confirmPassword,
                            builder: (context, state) {
                              return BlocBuilder<SignUpBloc, SignUpStates>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.08),
                                    child: CustomTextField(
                                        character: '*',
                                        onChanged: (value) {
                                          context.read<SignUpBloc>().add(
                                                ConfirmPasswordSignUpChanged(
                                                    confirmPassword: value),
                                              );
                                          confirmPasswordFieldKey.currentState!
                                              .validate();
                                        },
                                        fieldValidationkey:
                                            confirmPasswordFieldKey,
                                        hintText: "Repetir contraseña",
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        validate: (value) {
                                          return FieldValidator
                                              .validatePasswordMatch(
                                                  value.toString(),
                                                  state.password);
                                        },
                                        obscureText: state.obsecure1,
                                        sufixIcon: InkWell(
                                          onTap: () {
                                            context.read<SignUpBloc>().add(
                                                const ConfirmPasswordVisibilitySignUp());
                                          },
                                          child: Icon(
                                              state.obsecure1
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility,
                                              color: const Color(0xFF766B6B)),
                                        )),
                                  );
                                },
                              );
                            },
                          ),
                          // space
                          SizedBox(
                            height: height * .01,
                          ),
                          // radio button select text
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.10),
                            child: const Text(
                              "Por favor seleccione su posición.",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          // radio buttons
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.only(left: width * 0.08),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: CustomRadioButton(
                                            radioButtonColor: Colors.white,
                                            color: Colors.white,
                                            isSelected: state.selectvalue == 1,
                                            onChanged: () {
                                              context.read<SignUpBloc>().add(
                                                  const SelectRadioButtonSignUp(
                                                      selectedValue: 1));
                                            },
                                            label: "Demandante de empleo")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: CustomRadioButton(
                                            radioButtonColor: Colors.white,
                                            color: Colors.white,
                                            isSelected: state.selectvalue == 2,
                                            onChanged: () {
                                              context.read<SignUpBloc>().add(
                                                  const SelectRadioButtonSignUp(
                                                      selectedValue: 2));
                                            },
                                            label: "Dueño de negocio")),
                                  ],
                                ),
                              );
                            },
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
                          BlocBuilder<SignUpBloc, SignUpStates>(
                            buildWhen: (previous, current) =>
                                current.postApiStatus != previous.postApiStatus,
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.08),
                                child: CustomButton(
                                  width: width,
                                  height: height * 0.06,
                                  press: () async {
                                    bool isValid = key.currentState!.validate();

                                    if (state.selectvalue == 2 &&
                                        businessNameFieldKey.currentState !=
                                            null) {
                                      if (!businessNameFieldKey.currentState!
                                          .validate()) {
                                        isValid = false;
                                      }
                                    }
                                    if (isValid) {
                                      context
                                          .read<SignUpBloc>()
                                          .add(SignUpButtonEvent(token: token));
                                    } else {
                                      Utils.snackbar(context,
                                          "Kindly fill all required fields.");
                                    }
                                    if (key.currentState!.validate()) {
                                      context
                                          .read<SignUpBloc>()
                                          .add(SignUpButtonEvent(token: token));
                                    } else {
                                      Utils.snackbar(context,
                                          "Kindly fill the all required fields.");
                                    }
                                  },
                                  title: "Registrarme",
                                  color: AppColors.buttonColor,
                                ),
                              );
                            },
                          ),

                          SizedBox(
                            height: height * 0.04,
                          ),
                          // google login button
                          BlocListener<GoogleLoginBloc, GoogleLoginStates>(
                            listenWhen: (previous, current) =>
                                current.postApiStatus != previous.postApiStatus,
                            listener: (context, state) async {
                              if (state.postApiStatus ==
                                  PostApiStatus.loading) {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return const LoadingWidget();
                                    });
                              } else {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                if (state.postApiStatus ==
                                    PostApiStatus.error) {
                                  Utils.errorMessageFlush(
                                      state.message, context);
                                } else if (state.postApiStatus ==
                                    PostApiStatus.success) {
                                  await localStorage.setValue(
                                      'businessName', state.businessName);
                                  await localStorage.setRole(
                                      key: 'role',
                                      value: state.role.toString());
                                  if (state.role == 1) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckConnectivity(
                                                  child: MainScreen()),
                                        ),
                                        (route) => false);
                                    Utils.successMessageFlush(
                                        state.message, context);
                                  }
                                  if (state.role == 2) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CheckConnectivity(
                                                  child:
                                                      MainScreenBusinessOwner(
                                            businessName: state.businessName,
                                          )),
                                        ),
                                        (route) => false);
                                    Utils.successMessageFlush(
                                        state.message, context);
                                  }
                                }
                              }
                            },
                            child:
                                BlocBuilder<GoogleLoginBloc, GoogleLoginStates>(
                              buildWhen: (previous, current) =>
                                  current.postApiStatus !=
                                  previous.postApiStatus,
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context.read<GoogleLoginBloc>().add(
                                        GoogleLoginEvent(context: context));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.08,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                );
                              },
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
                                                const CheckConnectivity(
                                              child: LoginScreen(),
                                            ),
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
