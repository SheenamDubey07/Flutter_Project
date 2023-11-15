import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/Homee/bloc/home_bloc.dart';
import 'package:to_do/Homee/ui/product_tile_widget.dart';
import 'package:to_do/feature/cart/ui/cart.dart';
import 'package:to_do/feature/wishlist/ui/wishlist.dart';

class Homee extends StatefulWidget {
  const Homee({super.key});

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous,current) =>current is HomeActionState,
      buildWhen: (previous,current) =>current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigationToCartPageActionState ){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Cart()));
        }
        else if(state is HomeNavigationToWishlistPageActionState  ){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Wishlist()));
        }
        else if(state is HomeProductItemWishListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to the WishList')));
        }
        else if(state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to the Cart')));
        }

      },
      builder: (context, state) {
        switch (state.runtimeType){
          case HomeLoadingState:
            return Scaffold(body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Sheenam Grocery Store'),
            actions: [
              IconButton(
                  onPressed: (){
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                    } ,
                    icon: Icon(Icons.favorite)),
              IconButton(
                    onPressed: (){
                      homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                  icon: Icon(Icons.shopping_bag_outlined)),

        ],
        ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index){
                    return ProductTileWidget(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index]);
              }),

        );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
