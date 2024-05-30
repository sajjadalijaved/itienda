import '../../Utils/enum.dart';
import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import '../../Widgets/custombutton.dart';
import 'package:itienda/Utils/utils.dart';
import '../../Widgets/customtextfield.dart';
import '../../Widgets/connectivity_check.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utils/Validation/validation.dart';
import '../../config/componants/loading_widget.dart';
import 'package:itienda/Views/AuthenticationScreens/login.dart';
import 'package:itienda/Bloc/forgetPasswordBloc/forget_password_bloc.dart';
import 'package:itienda/Views/ForgetPassword/code_verification_screen.dart';

// ignore_for_file: must_be_immutable

class ConfirmNewPasswordScreen extends StatefulWidget {
  String email;
  String userId;
  ConfirmNewPasswordScreen(
      {super.key, required this.email, required this.userId});

  @override
  State<ConfirmNewPasswordScreen> createState() =>
      _ConfirmNewPasswordScreenState();
}

class _ConfirmNewPasswordScreenState extends State<ConfirmNewPasswordScreen> {
  late ForgetPasswordBloc forgetPasswordBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _newPasswordKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _confirmNewPasswordKey =
      GlobalKey<FormFieldState>();

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
                  builder: (context) =>
                      const CheckConnectivity(child: LoginScreen()),
                ),
                (route) => false);
            Utils.successMessageFlush(state.message, context);
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
                                        builder: (context) => CheckConnectivity(
                                            child: CodeVerificationScreen(
                                          email: widget.email,
                                        )),
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

                        const FittedBox(
                          fit: BoxFit.contain,
                          child: Center(
                            child: Text(
                              "Cambiar Contraseña",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        const Center(
                          child: Text(
                            "Ingresa tu nueva contraseña.",
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
                        // newPassword text field
                        BlocBuilder<ForgetPasswordBloc, ForgetPasswordStates>(
                          buildWhen: (previous, current) =>
                              current.password != previous.password,
                          builder: (context, state) {
                            return BlocBuilder<ForgetPasswordBloc,
                                ForgetPasswordStates>(
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.10),
                                  child: CustomTextField(
                                      character: '*',
                                      onChanged: (value) {
                                        context.read<ForgetPasswordBloc>().add(
                                              PasswordChanged(password: value),
                                            );
                                        _newPasswordKey.currentState!
                                            .validate();
                                      },
                                      fieldValidationkey: _newPasswordKey,
                                      hintText: "Nueva Contraseña",
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      validate: (value) {
                                        return FieldValidator.validatePassword(
                                            value.toString());
                                      },
                                      obscureText: state.obsecure,
                                      sufixIcon: InkWell(
                                        onTap: () {
                                          context.read<ForgetPasswordBloc>().add(
                                              const PasswordVisibilityEvent());
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
                        // space
                        SizedBox(
                          height: height * .02,
                        ),
                        // confirm password text field
                        BlocBuilder<ForgetPasswordBloc, ForgetPasswordStates>(
                          buildWhen: (previous, current) =>
                              current.confirmPassword !=
                              previous.confirmPassword,
                          builder: (context, state) {
                            return BlocBuilder<ForgetPasswordBloc,
                                ForgetPasswordStates>(
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.10),
                                  child: CustomTextField(
                                      character: '*',
                                      onChanged: (value) {
                                        context.read<ForgetPasswordBloc>().add(
                                              ConfirmPasswordChanged(
                                                  confirmPassword: value),
                                            );
                                        _confirmNewPasswordKey.currentState!
                                            .validate();
                                      },
                                      fieldValidationkey:
                                          _confirmNewPasswordKey,
                                      hintText: "Repetir Nueva Contraseña",
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
                                          context
                                              .read<ForgetPasswordBloc>()
                                              .add(
                                                const ConfirmPasswordVisibilityEvent(),
                                              );
                                        },
                                        child: Icon(
                                          state.obsecure1
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

                        SizedBox(
                          height: height * .05,
                        ),

                        BlocBuilder<ForgetPasswordBloc, ForgetPasswordStates>(
                          buildWhen: (previous, current) =>
                              current.postApiStatus != previous.postApiStatus,
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
                                        NewPasswordEvent(
                                            userId: widget.userId));
                                  } else {
                                    Utils.snackbar(context,
                                        "Kindly fill all required fields.");
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
