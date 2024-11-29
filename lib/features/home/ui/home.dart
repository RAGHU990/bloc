import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
     bloc: homeBloc,
    listenWhen: (previous, current) => !(current is HomeActionState),
    buildWhen: (previous, current) => !(current is HomeActionState),
    listener: (context, state) {
      // Handle state changes here if needed
    },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: const Text(
              "HELLO",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                },
                icon: Icon(Icons.favorite_border ),
                color: Colors.white,
              ),
                IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductCartButtonNavigateEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
