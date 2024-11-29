part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeActionState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {}

final class HomeErrorState extends HomeState {}

final class HomeNavtoWishlistPageActionState extends HomeActionState {}

final class HomeNavtoCartPageActionState extends HomeActionState {}
