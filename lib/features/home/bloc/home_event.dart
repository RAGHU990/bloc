part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonNavigateEvent extends HomeEvent {}

class HomeProductWishlistButtonNavigateEvent extends HomeEvent {}

class HomePrintHelloWorldEvent extends HomeEvent {}

class HomeClearHelloWorldEvent extends HomeEvent {}
