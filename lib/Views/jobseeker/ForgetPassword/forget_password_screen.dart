import 'dart:developer';
import '../../../Utils/enum.dart';
import '../../../Utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/custombutton.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../../Widgets/customtextfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Widgets/connectivity_check.dart';
import '../../../Utils/Validation/validation.dart';
import '../../../config/componants/loading_widget.dart';
import 'package:itienda/Views/jobseeker/AuthenticationScreens/login.dart';
import 'package:itienda/Bloc/forgetPasswordBloc/forget_password_bloc.dart';
import 'package:itienda/Views/jobseeker/ForgetPassword/code_verification_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgetPasswordBloc forgetPasswordBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _emailkey = GlobalKey<FormFieldState>();

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
                barrierDismissible: false,
                builder: (context) {
                  return const LoadingWidget();
                });
          } else {
            Navigator.of(context, rootNavigator: true).pop();
            if (state.postApiStatus == PostApiStatus.error) {
              Utils.errorMessageFlush(state.message, context);
              log("forget password:${state.message}");
            } else if (state.postApiStatus == PostApiStatus.success) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckConnectivity(
                        child: CodeVerificationScreen(
                      email: state.email,
                    )),
                  ),
                  (route) => false);
              Utils.successMessageFlush(state.message, context);
            }
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.07, top: height * 0.02),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckConnectivity(
                                            child: LoginScreen(),
                                          ),
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
                            height: height * 0.13,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.10,
                            ),
                            child: const Center(
                              child: Text(
                                "¿Olvidaste tu contraseña?",
                                style: TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: height * .03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.10, right: width * 0.10),
                            child: const Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Ingresa la direción de correo registrada para recibir un código de verficación.",
                                style: TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: height * .03,
                          ),
                          // email text field
                          BlocBuilder<ForgetPasswordBloc, ForgetPasswordStates>(
                            buildWhen: (previous, current) =>
                                current.email != previous.email,
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.10),
                                child: CustomTextField(
                                  validate: (value) {
                                    return FieldValidator.validateEmail(
                                        value.toString());
                                  },
                                  fieldValidationkey: _emailkey,
                                  hintText: "Correo Electrónico",
                                  textInputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.done,
                                  onChanged: (value) {
                                    context.read<ForgetPasswordBloc>().add(
                                          EmailChanged(email: value),
                                        );
                                    _emailkey.currentState!.validate();
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: height * .05,
                          ),
                          BlocBuilder<ForgetPasswordBloc, ForgetPasswordStates>(
                            buildWhen: (previous, current) =>
                                current.postApiStatus != previous.postApiStatus,
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.12),
                                child: CustomButton(
                                  width: width,
                                  height: height * 0.06,
                                  press: () async {
                                    if (_key.currentState!.validate()) {
                                      context.read<ForgetPasswordBloc>().add(
                                            const ForgetPasswordSendEmailEvent(),
                                          );
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const CheckConnectivityCodeVerififationScreen(),
                                      //   ),
                                      // );
                                    } else {
                                      Utils.snackbar(context,
                                          "Kindly fill the all required fields.");
                                    }
                                  },
                                  title: "Verificar",
                                  color: AppColors.buttonColor,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.20,
                          ),
                          const Divider(
                            color: AppColors.textWhiteColor,
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
