import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Widgets/text_widget.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: height * 0.02, left: width * 0.05, right: width * 0.05),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/noti.png",
              ),
              fit: BoxFit.cover),
        ),
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
                      "assets/14.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    const Text(
                      "Notificaciones",
                      style: TextStyle(
                          color: AppColors.textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 0.5,
                        color: const Color(0xFF365830),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SizedBox(
                          height: height * 0.03,
                          width: width,
                          child: Row(
                            children: [
                              text("Auxiliar Administrativo(a)", 16),
                              const Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: width * 0.02),
                                height: height,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "¡Nueva Vacante!",
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Company Name Sample",
                                style: TextStyle(
                                    color: Color(0xFF3E34B5),
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    fontSize: 14,
                                    fontFamily: "Montserrat"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.04),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/pin.png",
                                      height: height * 0.02,
                                    ),
                                    const Text(
                                      "Puerto Vallarta,Jalisco",
                                      style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 10,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.6),
                          child: SizedBox(
                            width: width,
                            child: text("09-01-2024", 12),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
