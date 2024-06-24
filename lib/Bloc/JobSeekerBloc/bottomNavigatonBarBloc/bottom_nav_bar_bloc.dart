import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'bottom_nav_bar_events.dart';
part 'bottom_nav_bar_states.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvents, BottomNavBarStates> {
  BottomNavBarBloc() : super(const BottomNavBarStates()) {
    on<BottomNavBarItemClickEvent>(_bottomNavBarItemsHandle);
  }

  void _bottomNavBarItemsHandle(
      BottomNavBarItemClickEvent event, Emitter<BottomNavBarStates> emit) {
    emit(
      state.copyWith(tabIndex: event.tabIndex),
    );
  }
}
