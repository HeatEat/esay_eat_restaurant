import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(const NavigationBarOrders(0));

  void getNavBarIndex(int index) {
    switch (index) {
      case 0:
        emit(const NavigationBarOrders(0));
        break;
      case 1:
        emit(const NavigationBarMenu(1));
        break;
      case 2:
        emit(const NavigationBarAccount(2));
        break;
      default:
        emit(const NavigationBarOrders(0));
        break;
    }
  }
}
