import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.loading = false,
      required this.width,
      required this.height,
      required this.press,
      required this.color,
      required this.title})
      : super(key: key);
  double height;
  double width;
  String title;
  Color color;
  VoidCallback press;
  bool loading;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
          ),
        ),
      ),
    );
  }
}
