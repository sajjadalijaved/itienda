import 'package:flutter/material.dart';
import 'package:itienda/Views/home_screen.dart';
import 'package:itienda/Views/ProfileScreens/profile_screen.dart';
import 'package:itienda/Views/CategoryScreens/categories_screen.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MainScreenViewModel extends ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen()
  ];

  List<String> icons = [
    "assets/home.png",
    "assets/category.png",
    "assets/user.png",
  ];

  List<String> lables = [
    "Inicio",
    "Categorías",
    "Perfil",
  ];
  set currentTabSet(int tab) {
    _currentTab = tab;
    notifyListeners();
  }

  int get currentTab => _currentTab;
  get currentScreen => _screen[_currentTab];
}
