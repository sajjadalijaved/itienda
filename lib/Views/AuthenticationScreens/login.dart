import '../../Utils/enum.dart';
import '../../Utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../Widgets/custombutton.dart';
import '../../Widgets/customtextfield.dart';
import '../../Bloc/loginBloc/login_bloc.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Widgets/connectivity_check.dart';
import 'package:itienda/Views/main_screen.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/config/componants/loading_widget.dart';
import 'package:itienda/Views/AuthenticationScreens/signupscreen.dart';
import 'package:itienda/Views/ForgetPassword/forget_password_screen.dart';

// ignore_for_file: missing_required_param

// ignore_for_file: depend_on_referenced_packages

// login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordFieldKey =
      GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginStates>(
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
          }
          if (state.postApiStatus == PostApiStatus.success) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false);
            Utils.successMessageFlush(state.message, context);
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          // scaffold
          child: Scaffold(
            // singlechildscrollview
            body: Container(
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
                      padding: EdgeInsets.only(top: height * 0.10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              "Acceda Ahora!",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontSize: 30,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Deja que tu próximo",
                              style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "empleador te encuentre.",
                              style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .05,
                          ),
                          // email text-field
                          BlocBuilder<LoginBloc, LoginStates>(
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
                                  style: const TextStyle(color: Colors.black),
                                  fieldValidationkey: emailFieldKey,
                                  hintText: "Usuario",
                                  textInputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    context
                                        .read<LoginBloc>()
                                        .add(EmailChanged(email: value));
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
                          // password text-field
                          BlocBuilder<LoginBloc, LoginStates>(
                            buildWhen: (previous, current) =>
                                previous.password != current.password,
                            builder: (context, state) {
                              return BlocBuilder<LoginBloc, LoginStates>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.08),
                                    child: CustomTextField(
                                        character: '*',
                                        onChanged: (value) {
                                          context.read<LoginBloc>().add(
                                                PasswordChanged(
                                                    password: value),
                                              );
                                          passwordFieldKey.currentState!
                                              .validate();
                                        },
                                        fieldValidationkey: passwordFieldKey,
                                        hintText: "Contraseña",
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        inputAction: TextInputAction.done,
                                        validate: (value) {
                                          return FieldValidator
                                              .validatePassword(
                                                  value.toString());
                                        },
                                        obscureText: state.obsecure,
                                        sufixIcon: InkWell(
                                          onTap: () {
                                            context.read<LoginBloc>().add(
                                                const PasswordVisibility());
                                          },
                                          child: Icon(
                                            state.obsecure
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility,
                                            color: const Color(0xFF766B6B),
                                          ),
                                        )),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 4,
                          ),

                          // forget password button
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: SizedBox(
                              height: height * .04,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckConnectivity(
                                          child: ForgetPasswordScreen(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Olvidé Contraseña',
                                      style: TextStyle(
                                          decorationColor:
                                              AppColors.textWhiteColor,
                                          decorationThickness: 2.5,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.textWhiteColor,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                  )),
                            ),
                          ),
                          // space
                          SizedBox(
                            height: height * .04,
                          ),
                          // login button
                          BlocBuilder<LoginBloc, LoginStates>(
                            buildWhen: (previous, current) =>
                                current.postApiStatus != previous.postApiStatus,
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.08),
                                child: CustomButton(
                                    width: 137,
                                    color: AppColors.buttonColor,
                                    height: height * 0.06,
                                    press: () {
                                      if (key.currentState!.validate()) {
                                        context
                                            .read<LoginBloc>()
                                            .add(const LoginButtonEvent());
                                      } else {
                                        Utils.snackbar(context,
                                            "Kindly fill the all required fields.");
                                      }
                                    },
                                    title: "Acceder"),
                              );
                            },
                          ),

                          // space
                          SizedBox(
                            height: height * .06,
                          ),
                          // google login button
                          BlocBuilder<LoginBloc, LoginStates>(
                            buildWhen: (previous, current) =>
                                current.postApiStatus != previous.postApiStatus,
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<LoginBloc>()
                                      .add(GoogleSignInEvent(context: context));
                                },
                                child: Padding(
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
                              );
                            },
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

                          SizedBox(
                            height: height * 0.08,
                          ),
                          // dont for have account text
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: const Divider(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          // don't have account text
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: SizedBox(
                              height: height * .04,
                              child: RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                const TextSpan(
                                  text: "¿No estás registrado?  ",
                                  style: TextStyle(
                                      color: AppColors.textWhiteColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Montserrat"),
                                ),
                                TextSpan(
                                    text: "Registrarme",
                                    style: const TextStyle(
                                        color: AppColors.textWhiteColor,
                                        fontSize: 16,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CheckConnectivity(
                                                child: SignUpScreen(),
                                              ),
                                            ),
                                            (route) => false);
                                      })
                              ])),
                            ),
                          ),
                          // space
                          SizedBox(
                            height: height * .05,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
