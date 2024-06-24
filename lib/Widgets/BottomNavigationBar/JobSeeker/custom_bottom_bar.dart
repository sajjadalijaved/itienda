import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itienda/Utils/appcolors.dart';
import 'package:itienda/Bloc/JobSeekerBloc/bottomNavigatonBarBloc/bottom_nav_bar_bloc.dart';

// ignore_for_file: use_key_in_widget_constructors

class BottomBar extends StatefulWidget {
  final int tabIndex;
  final BuildContext context;
  final List<String> icons;
  final List<String> lables;
  const BottomBar(
      {Key? key,
      required this.tabIndex,
      required this.context,
      required this.icons,
      required this.lables});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.width >= 744 ? size.height * .140 : size.height * .120,
      width: size.width,
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            width: 1,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: widget.icons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.read<BottomNavBarBloc>().add(
                  BottomNavBarItemClickEvent(tabIndex: index),
                );
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
                  bottom: index == widget.tabIndex ? 0 : size.width * .029,
                  right: size.width * .10,
                  left: size.width * .10,
                ),
                width: size.width * .128,
                height: index == widget.tabIndex ? size.width * .016 : 0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5),
                  ),
                ),
              ),
              Image.asset(widget.icons[index],
                  height: 35, width: 35, color: AppColors.textWhiteColor
                  // index == mainScreenViewModel.currentTab
                  //     ? const Color(0xFF365830)
                  //     : const Color(0xFF766B6B),
                  ),
              Text(
                widget.lables[index],
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
