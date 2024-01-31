import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/custom_bottom_bar.dart';
import 'package:itienda/view_model/main_screen_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final MainScreenViewModel mainScreenViewModel =
        Provider.of<MainScreenViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer<MainScreenViewModel>(
            builder: (context, value, child) =>
                mainScreenViewModel.currentScreen),
      ),
      bottomNavigationBar: BottomBar(
        mainScreenViewModel: mainScreenViewModel,
      ),
    );
  }
}
