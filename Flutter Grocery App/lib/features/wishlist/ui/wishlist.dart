import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/feature/cart/bloc/cart_bloc.dart';
import 'package:to_do/feature/wishlist/bloc/wishlist_bloc.dart';
import 'package:to_do/feature/wishlist/ui/wishlist_tile_widget.dart';

import '../../../Homee/ui/product_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous,current)=> current is WishlistActonState,
        buildWhen:  (previous,current)=> current is !WishlistActonState,
        builder: (context, state) {
          switch (state.runtimeType){
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
          itemCount: successState.wishlistItems.length,
          itemBuilder: (context, index){
          return WishlistTileWidget(
          wishlistBloc: wishlistBloc,
          productDataModel: successState.wishlistItems[index]);
          });
            default:
          }
          return Container();
        },
      ),

    );
  }
}
