part of 'navigation_bar_cubit.dart';

abstract class NavigationBarState extends Equatable {
  final int index;
  const NavigationBarState(this.index);

  @override
  List<Object> get props => [];
}

class NavigationBarOrders extends NavigationBarState {
  const NavigationBarOrders(super.index);
}

class NavigationBarMenu extends NavigationBarState {
  const NavigationBarMenu(super.index);
}

class NavigationBarAccount extends NavigationBarState {
  const NavigationBarAccount(super.index);
}
