import '../../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Widgets/text_widget.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: height * 0.02, left: width * 0.05, right: width * 0.05),
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/noti.png",
                  ),
                  fit: BoxFit.cover)),
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
                      "assets/13.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    const Text(
                      "Mensajes",
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
                itemCount: 2,
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
                        Row(
                          children: [
                            text("Auxiliar Administrativo(a)", 16),
                            const Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: width * 0.02),
                              width: width * 0.24,
                              height: height * 0.03,
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  const Text(
                                    "Abrir",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat"),
                                  ),
                                ],
                              ),
                            )
                          ],
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
                          height: height * 0.01,
                        )
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
