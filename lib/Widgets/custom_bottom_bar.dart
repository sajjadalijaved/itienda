import 'package:flutter/material.dart';
import 'package:itienda/view_model/main_screen_view_model.dart';
// ignore_for_file: use_key_in_widget_constructors

// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

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
      height: size.width * .230,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const BorderDirectional(
          top: BorderSide(
            width: 1,
            color: Color(0xFF766B6B),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
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
                  color: Color(0xFF365830),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
              ),
              Image.asset(
                mainScreenViewModel.icons[index],
                //width: size.width * .080,
                color: index == mainScreenViewModel.currentTab
                    ? const Color(0xFF365830)
                    : const Color(0xFF766B6B),
              ),
              Text(
                mainScreenViewModel.lables[index],
                style: TextStyle(
                  fontSize: 14,
                  color: index == mainScreenViewModel.currentTab
                      ? const Color(0xFF365830)
                      : const Color(0xFF766B6B),
                ),
              ),
              SizedBox(height: size.width * .02),
            ],
          ),
        ),
      ),
    );
  }
}
