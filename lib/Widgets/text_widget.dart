import '../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore_for_file: unused_element

Widget text(String text, double fontsize, {FontWeight? fontWeight}) {
  return Text(
    text.toString(),
    style: TextStyle(
        color: AppColors.textBlackColor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontFamily: "Montserrat"),
  );
}

Widget profileScreenText(
    String text, double fontsize, double minSize, double maxSize,
    {FontWeight? fontWeight}) {
  return AutoSizeText(
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    text.toString(),
    maxFontSize: maxSize,
    minFontSize: minSize,
    style: TextStyle(
        color: AppColors.textBlackColor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontFamily: "Montserrat"),
  );
}

Widget row(bool value, Widget text, BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  return Row(
    children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 22,
        width: 22,
        decoration: BoxDecoration(
            color: value == true ? AppColors.buttonColor : Colors.white,
            border: value == true
                ? Border.all(color: Colors.black)
                : Border.all(color: AppColors.regisgerColor),
            borderRadius: BorderRadius.circular(2)),
        child: Center(
          child: Icon(
            value == true ? Icons.check : null,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      SizedBox(
        width: width * 0.02,
      ),
      text
    ],
  );
}

Widget container(BuildContext context, void Function()? press,
    {required String text1, required String image}) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  return GestureDetector(
    onTap: press,
    child: Container(
      height: 40,
      width: width * 0.9,
      margin: EdgeInsets.only(bottom: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.5,
          color: const Color(0xFFFFFFFF),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.01,
          ),
          Image.asset(
            image,
            height: 25,
            width: 25,
          ),
          SizedBox(
            width: width * 0.03,
          ),
          Text(
            text1,
            style: const TextStyle(
                color: AppColors.textWhiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          )
        ],
      ),
    ),
  );
}
