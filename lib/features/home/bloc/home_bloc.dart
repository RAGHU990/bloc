import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);
    on<HomePrintHelloWorldEvent>(homePrintHelloWorldEvent);
    on<HomeClearHelloWorldEvent>(homeClearHelloWorldEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product Clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Product Clicked");
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate Clicked");
    emit(HomeNavtoWishlistPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(
      HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Wishlist Navigate Clicked");
    emit(HomeNavtoWishlistPageActionState());
  }

  FutureOr<void> homePrintHelloWorldEvent(
      HomePrintHelloWorldEvent event, Emitter<HomeState> emit) {
    emit(HomePrintHelloWorldPrintState("Hello World"));
  }

  FutureOr<void> homeClearHelloWorldEvent(
      HomeClearHelloWorldEvent event, Emitter<HomeState> emit) {
    emit(HomePrintHelloWorldPrintState(""));
  }
}
