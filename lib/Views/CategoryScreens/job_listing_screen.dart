import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class JobListingJobSeekerScreen extends StatefulWidget {
  String name;
  JobListingJobSeekerScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<JobListingJobSeekerScreen> createState() =>
      _JobListingJobSeekerScreenState();
}

class _JobListingJobSeekerScreenState extends State<JobListingJobSeekerScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/back.png",
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.02,
                      bottom: height * 0.02,
                      left: width * 0.04),
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
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: SizedBox(
                    height: 40,
                    width: 106,
                    child: Image.asset(
                      "assets/itienda.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.045, top: height * 0.01),
                  child: const Text(
                    "Encuentra las vacantes de empleo en abierto para el area de Puerto Vallarta, Jalisco.",
                    style: TextStyle(
                        color: AppColors.textWhiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.055,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(
                          text: "Categoría: ",
                          style: TextStyle(
                              color: AppColors.textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat"),
                        ),
                        TextSpan(
                          text: widget.name,
                          style: const TextStyle(
                              color: AppColors.textWhiteColor,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      width: width,
                      margin: EdgeInsets.only(bottom: height * 0.01),
                      decoration: BoxDecoration(
                        color: AppColors.textWhiteColor,
                        borderRadius: BorderRadius.circular(8),
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
                                FittedBox(
                                    fit: BoxFit.contain,
                                    child:
                                        text("Auxiliar Administrativo(a)", 16)),
                                const Spacer(),
                                Container(
                                  margin: EdgeInsets.only(right: width * 0.02),
                                  height: height,
                                  width: width * 0.24,
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                      child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "Postularme",
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                          fontFamily: "Montserrat"),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "Company Name Sample",
                                    style: TextStyle(
                                        color: Color(0xFF3E34B5),
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 14,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.04),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/pin.png",
                                        height: height * 0.02,
                                      ),
                                      const FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          "Puerto Vallarta,Jalisco",
                                          style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 10,
                                              fontFamily: "Montserrat"),
                                        ),
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
                          SizedBox(
                            width: width,
                            child: text(
                                "Here is the space that we will save for the job description. 208 caracters including spaces.  Here is the space that we will save for the job description.208 caracters including spaces.  Here is the spa.",
                                12),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  SizedBox(
                                      width: width * 0.45,
                                      child: const Text(
                                          "Lunes a Sábado.9am - 6pm.Con 1h de intervalo.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  AppColors.textBlackColor))),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // height: height * 0.06,
                                      // width: width * 0.06,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: const Center(
                                        child: Icon(
                                          FontAwesomeIcons.dollarSign,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    SizedBox(
                                        width: width * 0.22,
                                        child: const AutoSizeText(
                                          "\$8,000 más bonificaciones",
                                          maxFontSize: 12,
                                          minFontSize: 10,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textBlackColor,
                                              fontWeight: FontWeight.w900),
                                        ))
                                  ],
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
