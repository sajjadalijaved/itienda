import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import 'package:animate_do/animate_do.dart';
import '../../Widgets/customtextfield.dart';
import '../../Utils/no_connection_page.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:itienda/Bloc/bloc/connectivity_bloc.dart';
import 'package:itienda/Views/AuthenticationScreens/login.dart';
import 'package:itienda/Views/ForgetPassword/code_verification_screen.dart';

class CheckConnectivityForgetPassword extends StatelessWidget {
  const CheckConnectivityForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return const ForgetPassword();
        } else if (state is DisConnectedState) {
          return const NoConnectionPage();
        } else {
          return Container();
        }
      },
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final TextEditingController _emailController;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _emailkey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final authViewModal = Provider.of<AuthViewModal>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckConnectivityLogin(),
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
          child: Container(
              height: height,
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
                        padding: EdgeInsets.symmetric(horizontal: width * 0.20),
                        child: FadeInDown(
                          duration: const Duration(milliseconds: 1500),
                          child: SizedBox(
                              height: height * 0.2,
                              width: width * 0.4,
                              child: Center(
                                child: Image.asset(
                                  "assets/lock.png",
                                  fit: BoxFit.fill,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          duration: const Duration(milliseconds: 1000),
                          child: Center(
                              child: profileScreenText(
                                  "¿Olvidaste tu contraseña?", 24, 22, 24,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),

                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.10, right: width * 0.10),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1200),
                          duration: const Duration(milliseconds: 1000),
                          child: const Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Ingresa la direción de correo registrada para recibir",
                                style: TextStyle(
                                    color: AppColors.textBlackColor,
                                    fontSize: 13,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.26, vertical: height * 0.01),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1400),
                          duration: const Duration(milliseconds: 1000),
                          child: const Center(
                            child: Text(
                              "un código de verficación.",
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 14,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      // email text field
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1600),
                          duration: const Duration(milliseconds: 1000),
                          child: CustomTextField(
                            onTap: () {},
                            validate: (value) {
                              return FieldValidator.validateEmail(
                                  value.toString());
                            },
                            controller: _emailController,
                            fieldValidationkey: _emailkey,
                            hintText: "Correo Electrónico",
                            textInputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            onChanged: (value) {
                              _emailkey.currentState!.validate();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 1800),
                          duration: const Duration(milliseconds: 1000),
                          child: CustomButton(
                            loading: authViewModal.signinLoading,
                            width: width,
                            height: height * 0.07,
                            press: () async {
                              if (_key.currentState!.validate()) {
                                // Map data = {
                                //   'email': _emailController.text.trim(),
                                // };
                                // authViewModal.registerApi(data, context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CheckConnectivityCodeVerififationScreen(),
                                  ),
                                );
                              }
                            },
                            title: "Verificar",
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
