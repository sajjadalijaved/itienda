import '../custombutton.dart';
import '../../Utils/utils.dart';
import '../customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';
import '../../Utils/Validation/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../customRadioButton/radio_button.dart';
import 'package:itienda/Bloc/JobSeekerBloc/loginBloc/googleLoginBloc/google_bloc.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: library_private_types_in_public_api

class CustomDialog extends StatelessWidget {
  CustomDialog({super.key});

  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> businessNameFieldKey =
      GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<GoogleLoginBloc, GoogleLoginStates>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child: Form(
            key: keyForm,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'iTIENDA',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                // business name text field
                BlocBuilder<GoogleLoginBloc, GoogleLoginStates>(
                  builder: (context, state) {
                    return state.role == 2
                        ? Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: CustomTextField(
                              fieldValidationkey: businessNameFieldKey,
                              textCapitalization: TextCapitalization.words,
                              hintText: "nombre de empresa",
                              textInputType: TextInputType.name,
                              inputAction: TextInputAction.next,
                              validate: (value) {
                                return FieldValidator.validateBusinessName(
                                    value);
                              },
                              onChanged: (value) {
                                context.read<GoogleLoginBloc>().add(
                                      BusinessNameLoginChanged(
                                        businessName: value,
                                      ),
                                    );
                              },
                            ),
                          )
                        : const SizedBox();
                  },
                ),
                SizedBox(
                  height: state.role == 2 ? 10 : 0,
                ),
                const Text(
                  'Por favor seleccione su posición.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomRadioButton(
                          radioButtonColor: Colors.black,
                          color: Colors.black,
                          isSelected: state.role == 1,
                          onChanged: () {
                            context
                                .read<GoogleLoginBloc>()
                                .add(const SelectRadioButton(selectedValue: 1));
                          },
                          label: "Demandante de empleo"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                          radioButtonColor: Colors.black,
                          color: Colors.black,
                          isSelected: state.role == 2,
                          onChanged: () {
                            context
                                .read<GoogleLoginBloc>()
                                .add(const SelectRadioButton(selectedValue: 2));
                          },
                          label: "Dueño de negocio"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                        width: 30,
                        height: 30,
                        press: () {
                          bool isValid = keyForm.currentState!.validate();

                          if (state.role == 2 &&
                              businessNameFieldKey.currentState != null) {
                            if (!businessNameFieldKey.currentState!
                                .validate()) {
                              isValid = false;
                            }
                          }
                          if (isValid) {
                            if (Navigator.canPop(context)) {
                              Navigator.of(context).pop();
                            }
                          } else {
                            Utils.snackbar(
                                context, "Kindly fill all required fields.");
                          }
                          if (Navigator.canPop(context)) {
                            Navigator.of(context).pop();
                          }
                        },
                        color: AppColors.buttonColor,
                        title: 'Confirm')),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
