import 'dart:developer';
import '../../../Utils/enum.dart';
import '../../../Utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/custombutton.dart';
import 'package:itienda/Utils/appcolors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../config/componants/loading_widget.dart';
import 'package:itienda/Widgets/connectivity_check.dart';
import 'package:itienda/Utils/Validation/validation.dart';
import 'package:itienda/Bloc/forgetPasswordBloc/forget_password_bloc.dart';
import 'package:itienda/Views/jobseeker/ForgetPassword/forget_password_screen.dart';
import 'package:itienda/Views/jobseeker/ForgetPassword/confirm_new_password_screen.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: unused_import

class CodeVerificationScreen extends StatefulWidget {
  String email;
  CodeVerificationScreen({super.key, required this.email});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  late ForgetPasswordBloc forgetPasswordBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    forgetPasswordBloc = ForgetPasswordBloc();
  }

  @override
  void dispose() {
    forgetPasswordBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: BlocListener<ForgetPasswordBloc, ForgetPasswordStates>(
        listenWhen: (previous, current) =>
            current.postApiStatus != previous.postApiStatus,
        listener: (context, state) {
          if (state.postApiStatus == PostApiStatus.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return const LoadingWidget();
                });
          } else {
            Navigator.of(context, rootNavigator: true).pop();
            if (state.postApiStatus == PostApiStatus.error) {
              Utils.errorMessageFlush(state.message, context);
            } else if (state.postApiStatus == PostApiStatus.success) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckConnectivity(
                        child: ConfirmNewPasswordScreen(
                      email: widget.email,
                      userId: state.userId,
                    )),
                  ),
                  (route) => false);
              Utils.successMessageFlush(state.message, context);
            }
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
                    height: height,
                    width: width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/back.png"),
                          fit: BoxFit.fill),
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
                                                const CheckConnectivity(
                                                    child:
                                                        ForgetPasswordScreen()),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.08),
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
                            // code text field
                            BlocBuilder<ForgetPasswordBloc,
                                ForgetPasswordStates>(
                              buildWhen: (previous, current) =>
                                  current.code != previous.code,
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.10),
                                  child: SizedBox(
                                      height: height * .10,
                                      child: PinCodeTextField(
                                        enableActiveFill: true,
                                        appContext: context,
                                        autoDisposeControllers: false,
                                        cursorColor: const Color(0xFF365830),
                                        blinkWhenObscuring: true,
                                        keyboardType: TextInputType.number,
                                        obscuringCharacter: "*",
                                        length: 4,
                                        onChanged: (value) {
                                          context
                                              .read<ForgetPasswordBloc>()
                                              .add(
                                                VerificationCodeFieldChanged(
                                                    code: value),
                                              );
                                          // setState(() {
                                          //   value1 = value;
                                          // });
                                        },
                                        validator: (value) {
                                          return FieldValidator.validatePinCode(
                                              value);
                                        },
                                        onCompleted: (value) => log(value),
                                        pinTheme: PinTheme(
                                            disabledBorderWidth: 1,
                                            shape: PinCodeFieldShape.box,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            inactiveColor:
                                                const Color(0xFF365830),
                                            activeColor:
                                                const Color(0xFF365830),
                                            selectedColor:
                                                const Color(0xFF365830),
                                            activeFillColor:
                                                AppColors.textWhiteColor,
                                            inactiveFillColor:
                                                AppColors.textWhiteColor,
                                            fieldHeight: 50,
                                            fieldWidth: 50),
                                      )),
                                );
                              },
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
                            BlocBuilder<ForgetPasswordBloc,
                                ForgetPasswordStates>(
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.15),
                                  child: CustomButton(
                                    width: width,
                                    height: height * 0.06,
                                    press: () async {
                                      if (_key.currentState!.validate()) {
                                        context.read<ForgetPasswordBloc>().add(
                                              VerificationCodeSendEvent(
                                                  userName:
                                                      widget.email.toString()),
                                            );
                                      } else {
                                        Utils.snackbar(context,
                                            "Kindly enter verification code.");
                                      }
                                    },
                                    title: "Confirmar",
                                    color: AppColors.buttonColor,
                                  ),
                                );
                              },
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
        ),
      ),
    );
  }
}
