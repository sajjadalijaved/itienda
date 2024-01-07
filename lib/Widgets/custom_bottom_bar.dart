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
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            width: 1,
            color: Color(0xFF766B6B),
          ),
        ),
      ),
      child: BottomNavigationBar(
          onTap: (int index) {
            mainScreenViewModel.currentTabSet = index;
          },
          currentIndex: mainScreenViewModel.currentTab,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xFF365830),
          unselectedItemColor: const Color(0xFF766B6B),
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF365830),
              fontSize: 12,
              fontFamily: 'Montserrat'),
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xFF766B6B),
              fontSize: 12,
              fontFamily: 'Montserrat'),
          items: mainScreenViewModel.items
              .map((e) => BottomNavigationBarItem(
                  icon: Image.asset(
                    e.icon.toString(),
                    height: height * 0.04,
                  ),
                  label: e.lable))
              .toList()),
    );
  }
}

// index == mainScreenViewModel.currentTab
//               ? Container(
//                   height: 50,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.green,
//                   ),
//                 )
//               : const SizedBox(),