import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/custombutton.dart';
import '../../view_model/view_modal.dart';
import '../../Widgets/customtextfield.dart';
import '../../Utils/no_connection_page.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                                          const CheckConnectivityLogin(),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.10),
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
                      SizedBox(
                        height: height * .05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                        child: CustomButton(
                          loading: authViewModal.signinLoading,
                          width: width,
                          height: height * 0.06,
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
    );
  }
}
