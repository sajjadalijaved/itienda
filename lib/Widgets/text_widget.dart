import '../Utils/appcolors.dart';
import 'package:flutter/material.dart';

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

Widget row(ValueNotifier<bool> checkbox, Widget text, BuildContext context) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  return Row(
    children: [
      ValueListenableBuilder(
          valueListenable: checkbox,
          builder: (context, value, child) => GestureDetector(
                onTap: () {
                  checkbox.value = !checkbox.value;
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 6),
                  height: height * 0.02,
                  width: width * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 0.5, color: AppColors.textLoginColor),
                  ),
                  child: checkbox.value == true
                      ? const Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.black,
                        )
                      : null,
                ),
              )),
      SizedBox(
        width: width * 0.02,
      ),
      text
    ],
  );
}

Widget container(BuildContext context, void Function()? press, String text1) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  return GestureDetector(
    onTap: press,
    child: Container(
      height: height * 0.04,
      width: width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: const Color(0xFF365830),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.01,
          ),
          const Icon(
            Icons.arrow_forward_outlined,
            size: 25,
          ),
          SizedBox(
            width: width * 0.03,
          ),
          text(text1, 16)
        ],
      ),
    ),
  );
}
