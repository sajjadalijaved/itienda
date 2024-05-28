import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
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
        // singlechildscrollview
        body: Consumer<AuthViewModal>(
          builder: (context, value, child) => SingleChildScrollView(
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
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
                            // space
                            SizedBox(
                              height: height * .02,
                            ),
                            // password text-field
                            ValueListenableBuilder(
                              valueListenable: obscureText,
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
                            const SizedBox(
                              height: 4,
                            ),

                            // forget password button
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
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
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Olvidé Contraseña',
                                        style: TextStyle(
                                            decorationColor:
                                                AppColors.textWhiteColor,
                                            decorationThickness: 2.5,
                                            decoration:
                                                TextDecoration.underline,
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
                              child: CustomButton(
                                  loading: authViewModal.loginloading,
                                  width: 137,
                                  color: AppColors.buttonColor,
                                  height: height * 0.06,
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

                            // space
                            SizedBox(
                              height: height * .06,
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

                            SizedBox(
                              height: height * 0.08,
                            ),
                            // dont for have account text
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01),
                              child: const Divider(
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            // don't have account text
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
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
                                                    const CheckConnectivitySignUp(),
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
                  ))),
        ),
      ),
    );
  }
}
