part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarStates extends Equatable {
  final int tabIndex;
  const BottomNavBarStates({this.tabIndex = 0});

  BottomNavBarStates copyWith({int? tabIndex}) {
    return BottomNavBarStates(tabIndex: tabIndex ?? this.tabIndex);
  }

  @override
  List<Object> get props => [tabIndex];
}
