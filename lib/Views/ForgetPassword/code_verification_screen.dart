import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Widgets/no_connection_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:itienda/Utils/Validation/validation.dart';
import 'package:itienda/Bloc/conectivityBloc/connectivity_bloc.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/back.png"), fit: BoxFit.fill),
                ),
                child: Form(
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.07,
                          ),
                          child: Row(
                            children: [
                              IconButton(
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
                                  color: AppColors.textWhiteColor,
                                ),
                              ),
                              const Text(
                                "Acceda Ahora",
                                style: TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.12,
                        ),
                        const Center(
                          child: Text(
                            "Verificación",
                            style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.08),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Ingresa el código de 4 dígitos que recibiste en la dirección de correo registrada.",
                            style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat"),
                          ),
                        ),

                        SizedBox(
                          height: height * .03,
                        ),
                        // email text field
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.10),
                          child: SizedBox(
                              height: height * .10,
                              child: PinCodeTextField(
                                enableActiveFill: true,
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
                                  return FieldValidator.validatePinCode(value);
                                },
                                onCompleted: (value) => log(value),
                                pinTheme: PinTheme(
                                    disabledBorderWidth: 1,
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    inactiveColor: const Color(0xFF365830),
                                    activeColor: const Color(0xFF365830),
                                    selectedColor: const Color(0xFF365830),
                                    activeFillColor: AppColors.textWhiteColor,
                                    inactiveFillColor: AppColors.textWhiteColor,
                                    fieldHeight: 50,
                                    fieldWidth: 50),
                              )),
                        ),

                        RichText(
                            text: const TextSpan(children: <InlineSpan>[
                          TextSpan(
                              text: "El código expira en ",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                          TextSpan(
                            text: "24h",
                            style: TextStyle(
                                color: AppColors.textWhiteColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.textWhiteColor,
                                decorationThickness: 3,
                                fontWeight: FontWeight.w500),
                          )
                        ])),
                        SizedBox(
                          height: height * .05,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.15),
                          child: CustomButton(
                            loading: authViewModal.signinLoading,
                            width: width,
                            height: height * 0.06,
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
                        SizedBox(
                          height: height * 0.16,
                        ),
                        const Divider(
                          color: AppColors.textWhiteColor,
                        )
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
