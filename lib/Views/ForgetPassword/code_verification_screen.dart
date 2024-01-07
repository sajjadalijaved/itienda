import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import 'package:animate_do/animate_do.dart';
import '../../Utils/no_connection_page.dart';
import 'package:itienda/Utils/appcolors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:itienda/Utils/Validation/validation.dart';
import 'package:itienda/Bloc/bloc/connectivity_bloc.dart';
import 'package:itienda/Views/ForgetPassword/forget_password_screen.dart';
import 'package:itienda/Views/ForgetPassword/confirm_new_password_screen.dart';

class CheckConnectivityCodeVerififationScreen extends StatelessWidget {
  const CheckConnectivityCodeVerififationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return const CodeVerificationScreen();
        } else if (state is DisConnectedState) {
          return const NoConnectionPage();
        } else {
          return Container();
        }
      },
    );
  }
}

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String value1 = "";

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final authViewModal = Provider.of<AuthViewModal>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CheckConnectivityForgetPassword(),
                  ),
                  (route) => false);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.buttonColor,
            )),
        title: const Text(
          "Acceda Ahora!",
          style: TextStyle(
              color: AppColors.appbarTitleColor,
              fontSize: 20,
              fontFamily: "Montserrat"),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                height: height - kBottomNavigationBarHeight,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/back.png"),
                      alignment: Alignment.bottomRight),
                ),
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.09),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.26),
                          child: FadeInDown(
                            duration: const Duration(milliseconds: 1500),
                            child: SizedBox(
                                height: height * 0.2,
                                width: width,
                                child: Image.asset(
                                  "assets/code.png",
                                )),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.25),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1000),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * 0.04,
                              width: width,
                              child: const Center(
                                child: Text(
                                  "Verificación",
                                  style: TextStyle(
                                      color: AppColors.textBlackColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Medium"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: width * 0.10, right: 10),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1200),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * 0.03,
                              width: width,
                              child: const Text(
                                "Ingresa el código de 4 dígitos que recibiste en la",
                                style: TextStyle(
                                    color: AppColors.textBlackColor,
                                    fontSize: 14,
                                    fontFamily: "Regular"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.24),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1400),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * 0.02,
                              width: width,
                              child: const Center(
                                child: Text(
                                  "dirección de correo registrada.",
                                  style: TextStyle(
                                      color: AppColors.textBlackColor,
                                      fontSize: 14,
                                      height: 1,
                                      fontFamily: "Regular"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .03,
                        ),
                        // email text field
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.10),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1600),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                                height: height * .08,
                                child: PinCodeTextField(
                                  appContext: context,
                                  controller: _codeController,
                                  autoDisposeControllers: false,
                                  cursorColor: const Color(0xFF365830),
                                  blinkWhenObscuring: true,
                                  keyboardType: TextInputType.number,
                                  obscuringCharacter: "*",
                                  length: 4,
                                  onChanged: (value) {
                                    setState(() {
                                      value1 = value;
                                    });
                                  },
                                  validator: (value) {
                                    return FieldValidator.validatePinCode(
                                        value);
                                  },
                                  onCompleted: (value) => log(value),
                                  pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      inactiveColor: const Color(0xFF365830),
                                      activeColor: const Color(0xFF365830),
                                      selectedColor: const Color(0xFF766B6B),
                                      borderWidth: 1,
                                      fieldHeight: 50,
                                      fieldWidth: 50),
                                )

                                //  PinCodeTextField(

                                //   autofocus: false,
                                //   controller: _codeController,
                                //   hideCharacter: true,
                                //   highlight: true,
                                //   highlightColor: const Color(0xFF006341),
                                //   defaultBorderColor: Colors.black38,
                                //   highlightPinBoxColor: Colors.white,
                                //   maxLength: 4,
                                //   maskCharacter: "*",
                                //   onDone: (text) {},
                                //   pinBoxWidth: 50,
                                //   pinBoxHeight: 50,
                                //   wrapAlignment: WrapAlignment.spaceBetween,
                                //   pinBoxDecoration: ProvidedPinBoxDecoration
                                //       .roundedPinBoxDecoration,
                                //   pinTextStyle: const TextStyle(fontSize: 22.0),
                                //   pinTextAnimatedSwitcherTransition:
                                //       ProvidedPinBoxTextAnimation.scalingTransition,
                                //   pinTextAnimatedSwitcherDuration:
                                //       const Duration(milliseconds: 300),
                                //   highlightAnimationEndColor: Colors.white12,
                                //   keyboardType: TextInputType.number,
                                // ),
                                ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.30),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 1800),
                            duration: const Duration(milliseconds: 1000),
                            child: SizedBox(
                              height: height * 0.02,
                              width: width,
                              child: Center(
                                child: RichText(
                                    text: const TextSpan(children: <InlineSpan>[
                                  TextSpan(
                                      text: "El código expira en ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14)),
                                  TextSpan(
                                    text: "24h",
                                    style: TextStyle(
                                        color: AppColors.textBlackColor,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            AppColors.textBlackColor,
                                        decorationThickness: 3,
                                        fontWeight: FontWeight.w500),
                                  )
                                ])),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.15),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 2000),
                            duration: const Duration(milliseconds: 1000),
                            child: CustomButton(
                              loading: authViewModal.signinLoading,
                              width: width,
                              height: height * 0.07,
                              press: () async {
                                if (_key.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CheckConnectivityConfirmPasswordScreen(),
                                    ),
                                  );
                                  // Map data = {
                                  //   'email': _emailController.text.trim(),
                                  // };
                                  // authViewModal.registerApi(data, context);
                                }
                              },
                              title: "Confirmar",
                              color: AppColors.buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
