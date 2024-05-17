import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';
import 'package:itienda/view_model/main_screen_view_model.dart';
// ignore_for_file: use_key_in_widget_constructors

class BottomBar extends StatelessWidget {
  final MainScreenViewModel mainScreenViewModel;
  const BottomBar({
    Key? key,
    required this.mainScreenViewModel,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .120,
      width: size.width,
      decoration: const BoxDecoration(
        // color: Colors.white,
        border: BorderDirectional(
          top: BorderSide(
            width: 1,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: mainScreenViewModel.icons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            mainScreenViewModel.currentTabSet = index;
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == mainScreenViewModel.currentTab
                      ? 0
                      : size.width * .029,
                  right: size.width * .1,
                  left: size.width * .1,
                ),
                width: size.width * .128,
                height: index == mainScreenViewModel.currentTab
                    ? size.width * .016
                    : 0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
              ),
              Image.asset(mainScreenViewModel.icons[index],
                  height: 40, width: 40, color: AppColors.textWhiteColor
                  // index == mainScreenViewModel.currentTab
                  //     ? const Color(0xFF365830)
                  //     : const Color(0xFF766B6B),
                  ),
              Text(
                mainScreenViewModel.lables[index],
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textWhiteColor),
              ),
              SizedBox(height: size.height * .001),
            ],
          ),
        ),
      ),
    );
  }
}
