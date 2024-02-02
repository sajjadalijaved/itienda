import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import 'package:animate_do/animate_do.dart';
import '../../Widgets/customtextfield.dart';
import '../../Utils/no_connection_page.dart';
import 'package:itienda/Utils/appcolors.dart';
import 'package:itienda/Views/main_screen.dart';
import '../../Utils/Validation/validation.dart';
import '../../Bloc/bloc/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Views/AuthenticationScreens/signupscreen.dart';
import 'package:itienda/Views/ForgetPassword/forget_password_screen.dart';

// ignore_for_file: depend_on_referenced_packages

class CheckConnectivityLogin extends StatelessWidget {
  const CheckConnectivityLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return const LoginScreen();
        } else if (state is DisConnectedState) {
          return const NoConnectionPage();
        } else {
          return Container();
        }
      },
    );
  }
}

// login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordFieldKey =
      GlobalKey<FormFieldState>();
  // show password icon provider
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
// field colors
  Color emailColor = Colors.black26;
  Color passwordColor = Colors.black26;
  Color eyeColor = Colors.black26;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        // backgroundColor
        backgroundColor: Colors.white,
        // singlechildscrollview
        body: Consumer<AuthViewModal>(
          builder: (context, value, child) => SingleChildScrollView(
              child: SafeArea(
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
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1000),
                            duration: const Duration(milliseconds: 1000),
                            child: const Center(
                              child: Text(
                                "Acceda Ahora!",
                                style: TextStyle(
                                    color: AppColors.textLoginColor,
                                    fontSize: 28,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1200),
                            duration: const Duration(milliseconds: 1000),
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
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1400),
                            duration: const Duration(milliseconds: 1000),
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
                        SizedBox(
                          height: height * .05,
                        ),
                        // email text-field
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1600),
                            duration: const Duration(milliseconds: 1000),
                            child: CustomTextField(
                              onTap: () {},
                              validate: (value) {
                                return FieldValidator.validateEmail(
                                    value.toString());
                              },
                              style: const TextStyle(color: Colors.black),
                              controller: emailController,
                              fieldValidationkey: emailFieldKey,
                              hintText: "Usuario",
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
                        // password text-field
                        ValueListenableBuilder(
                          valueListenable: obscureText,
                          builder: (context, value, child) => Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: FadeInUp(
                              delay: const Duration(milliseconds: 1800),
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
                                inputAction: TextInputAction.done,
                                validate: (value) {
                                  return FieldValidator.validatePassword(
                                      value.toString());
                                },
                                obscureText: obscureText.value,
                                sufixIcon: InkWell(
                                    onTap: () {
                                      obscureText.value = !obscureText.value;
                                    },
                                    child: Icon(
                                        obscureText.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility,
                                        color: const Color(0xFF766B6B))),
                              ),
                            ),
                          ),
                        ),

                        // forget password button
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2000),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * .04,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckConnectivityForgetPassword(),
                                      ),
                                    );
                                  },
                                  child: const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      'Olvidé Contraseña',
                                      style: TextStyle(
                                          decorationColor: Colors.black,
                                          decoration: TextDecoration.underline,
                                          color: AppColors.textBlackColor,
                                          fontFamily: "Montserrat",
                                          fontSize: 16),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        // space
                        SizedBox(
                          height: height * .02,
                        ),
                        // login button
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2200),
                            duration: const Duration(milliseconds: 1000),
                            child: CustomButton(
                                loading: authViewModal.loginloading,
                                width: 137,
                                color: AppColors.buttonColor,
                                height: height * 0.07,
                                press: () {
                                  // if (key.currentState!.validate()) {
                                  //   Map data = {
                                  //     'email': emailController.text.trim(),
                                  //     'password': passwordController.text.trim()
                                  //   };
                                  //   authViewModal.loginApi(data, context);
                                  // } else {
                                  //   Utils.errorMessageFlush(
                                  //       "Failed to login", context);
                                  // }
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen(),
                                      ),
                                      (route) => false);
                                },
                                title: "Acceder"),
                          ),
                        ),

                        // space
                        SizedBox(
                          height: height * .20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2300),
                            duration: const Duration(milliseconds: 1000),
                            child: const Divider(
                              color: Color(0xFF766B6B),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        // don't have account text
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2500),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * .04,
                              child: RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                const TextSpan(
                                  text: "¿No estás registrado?  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "Montserrat"),
                                ),
                                TextSpan(
                                    text: "Registrarme",
                                    style: const TextStyle(
                                        color: AppColors.regisgerColor,
                                        fontSize: 18,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CheckConnectivitySignUp(),
                                            ),
                                            (route) => false);
                                      })
                              ])),
                            ),
                          ),
                        ),
                        // space
                        SizedBox(
                          height: height * .05,
                        )
                      ],
                    ),
                  ),
                )),
          )),
        ),
      ),
    );
  }
}
