import 'package:flutter/material.dart';
import 'package:itienda/Views/home_screen.dart';
import 'package:itienda/Views/profile_screen.dart';
import 'package:itienda/Views/categories_screen.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MainScreenViewModel extends ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen()
  ];

  List<BottomBarItem> items = [
    BottomBarItem(icon: "assets/home.png", lable: "Inicio"),
    BottomBarItem(icon: "assets/category.png", lable: "Categorías"),
    BottomBarItem(icon: "assets/user.png", lable: "Perfil"),
  ];

  set currentTabSet(int tab) {
    _currentTab = tab;
    notifyListeners();
  }

  int get currentTab => _currentTab;
  get currentScreen => _screen[_currentTab];
}

class BottomBarItem {
  String? lable;
  String? icon;
  BottomBarItem({
    this.lable,
    this.icon,
  });
}
