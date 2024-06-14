import '../../../Utils/appcolors.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: height * 0.02, left: width * 0.05, right: width * 0.04),
        height: height,
        width: width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/policy.jpg",
                ),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: AppColors.textWhiteColor,
                      ),
                    ),
                    const Text(
                      "Volver",
                      style: TextStyle(
                          color: AppColors.textWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                width: 106,
                child: Image.asset(
                  "assets/itienda.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.05,
                width: width,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/16.png",
                      height: 40,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    const Text(
                      "Política de Privacidad",
                      style: TextStyle(
                          color: AppColors.textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
