import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import 'package:animate_do/animate_do.dart';
import '../../Widgets/customtextfield.dart';
import '../../Utils/no_connection_page.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Bloc/bloc/connectivity_bloc.dart';
import 'package:itienda/Views/AuthenticationScreens/login.dart';
import 'package:itienda/Views/ForgetPassword/code_verification_screen.dart';

class CheckConnectivityConfirmPasswordScreen extends StatelessWidget {
  const CheckConnectivityConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return const ConfirmNewPasswordScreen();
        } else if (state is DisConnectedState) {
          return const NoConnectionPage();
        } else {
          return Container();
        }
      },
    );
  }
}

class ConfirmNewPasswordScreen extends StatefulWidget {
  const ConfirmNewPasswordScreen({super.key});

  @override
  State<ConfirmNewPasswordScreen> createState() =>
      _ConfirmNewPasswordScreenState();
}

class _ConfirmNewPasswordScreenState extends State<ConfirmNewPasswordScreen> {
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmNewPasswordController;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _newPasswordKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _confirmNewPasswordKey =
      GlobalKey<FormFieldState>();
  ValueNotifier<bool> passwordobsureText = ValueNotifier<bool>(true);
  ValueNotifier<bool> confirmPasswordObscureText = ValueNotifier<bool>(true);
  ValueNotifier<bool> checkbox = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _confirmNewPasswordController.dispose();
    _newPasswordController.dispose();
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
                        const CheckConnectivityCodeVerififationScreen(),
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.26,
                        right: width * 0.26,
                      ),
                      child: FadeInDown(
                        duration: const Duration(milliseconds: 1500),
                        child: SizedBox(
                            height: height * 0.2,
                            width: width,
                            child: Center(
                              child: Image.asset(
                                "assets/code.png",
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.20, right: width * 0.18),
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1000),
                        duration: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          height: height * 0.04,
                          width: width,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Cambiar Contraseña",
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.24),
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1200),
                        duration: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          height: height * 0.02,
                          width: width,
                          child: const Text(
                            "Ingresa tu nueva contraseña.",
                            style: TextStyle(
                                color: AppColors.textBlackColor,
                                fontSize: 14,
                                height: 1,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: height * .04,
                    ),
                    // email text field
                    ValueListenableBuilder(
                      valueListenable: passwordobsureText,
                      builder: (context, value, child) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1400),
                          duration: const Duration(milliseconds: 1000),
                          child: CustomTextField(
                            onTap: () {},
                            character: '*',
                            onChanged: (value) {
                              _newPasswordKey.currentState!.validate();
                            },
                            controller: _newPasswordController,
                            fieldValidationkey: _newPasswordKey,
                            hintText: "Nueva Contraseña",
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
                                color: const Color(0xFF766B6B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // space
                    SizedBox(
                      height: height * .02,
                    ),
                    // confirm password text field
                    ValueListenableBuilder(
                      valueListenable: confirmPasswordObscureText,
                      builder: (context, value, child) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1600),
                          duration: const Duration(milliseconds: 1000),
                          child: CustomTextField(
                            onTap: () {},
                            character: '*',
                            onChanged: (value) {
                              _confirmNewPasswordKey.currentState!.validate();
                            },
                            controller: _confirmNewPasswordController,
                            fieldValidationkey: _confirmNewPasswordKey,
                            hintText: "Repetir Nueva Contraseña",
                            textInputType: TextInputType.visiblePassword,
                            validate: (value) {
                              return FieldValidator.validatePasswordMatch(
                                  value.toString(),
                                  _newPasswordController.text.toString());
                            },
                            obscureText: confirmPasswordObscureText.value,
                            sufixIcon: InkWell(
                              onTap: () {
                                confirmPasswordObscureText.value =
                                    !confirmPasswordObscureText.value;
                              },
                              child: Icon(
                                confirmPasswordObscureText.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: const Color(0xFF766B6B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 1800),
                        duration: const Duration(milliseconds: 1000),
                        child: Row(
                          children: [
                            ValueListenableBuilder(
                                valueListenable: checkbox,
                                builder: (context, value, child) => Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: const Color(0xFF006341),
                                      side: const BorderSide(
                                          color: Colors.black, width: 1),
                                      value: checkbox.value,
                                      onChanged: (value) {
                                        checkbox.value = !checkbox.value;
                                      },
                                    )),
                            const Text(
                              "Recordarme",
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 14,
                                  fontFamily: "Montserrat"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // space
                    SizedBox(
                      height: height * .03,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 2000),
                        duration: const Duration(milliseconds: 1000),
                        child: CustomButton(
                          loading: authViewModal.signinLoading,
                          width: width,
                          height: height * 0.07,
                          press: () async {
                            if (_key.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CheckConnectivityLogin(),
                                  ),
                                  (route) => false);
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
            ),
          ),
        ),
      ),
    );
  }
}
