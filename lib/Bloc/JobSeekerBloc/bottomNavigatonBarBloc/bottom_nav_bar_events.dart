part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarEvents extends Equatable {
  const BottomNavBarEvents();
  @override
  List<Object> get props => [];
}

class BottomNavBarItemClickEvent extends BottomNavBarEvents {
  final int tabIndex;
  const BottomNavBarItemClickEvent({required this.tabIndex});
  @override
  List<Object> get props => [tabIndex];
}
