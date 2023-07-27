
import 'package:calculator/screens/cart/data/data_sources/dto.dart';
import 'package:calculator/screens/cart/presenation/components/cart_card.dart';
import 'package:calculator/screens/cart/presenation/components/check_out_card.dart';
import 'package:calculator/screens/cart/presenation/manager/cubit.dart';
import 'package:calculator/screens/cart/presenation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Cart.dart';
import '../../size_config.dart';
import '../home/presenation/manager/cubit.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(RemoteCartDto())..getCart(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is CartErrorStates) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.failures.message),
              ),
            );
          }
          if (state is CartLoadingStates) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is CartSuccessStates) {

          }
        },
        builder: (context, state) {
          return CartCubit.get(context).cartResponse.isEmpty ?
         const Center(child: CircularProgressIndicator())
          :Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: CartCubit.get(context).cartResponse.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(CartCubit.get(context).cartResponse[index]?.sId??'' ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {

                      CartCubit.get(context)
                          .deleteItem( CartCubit.get(context).cartResponse[index]?.sId?? "");

                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(product: CartCubit.get(context).cartResponse[index]!.products![index]),
                  ),
                ),
          ),
        ),
        bottomNavigationBar: CheckoutCard(),
      );

        },

      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
