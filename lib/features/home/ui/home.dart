// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/ui/cart.dart';
import 'package:flutter_application_1/features/home/bloc/home_bloc.dart';
import 'package:flutter_application_1/wishlist/ui/wishlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => (current is HomeActionState),
      buildWhen: (previous, current) => (current is! HomeActionState),
      listener: (context, state) {
        String displayText;

        if (state is HomeNavtoWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeNavtoCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        }
      },
      builder: (context, state) {
        String displayText = "";

        if (state is HomePrintHelloWorldPrintState) {
          displayText = state.message;
        }
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
                icon: Icon(Icons.favorite_border),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Text(
                        displayText,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        homeBloc.add(HomePrintHelloWorldEvent());
                      },
                      child: Text("print"),
                      style: ElevatedButton.styleFrom(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {homeBloc.add(HomeClearHelloWorldEvent() );},
                    child: Text("clear"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
