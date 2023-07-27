import 'dart:collection';

import 'package:calculator/screens/category_details/presentation/pages/details_screen.dart';
import 'package:calculator/screens/home/presenation/components/fav_tab/brand_cubit.dart';
import 'package:calculator/screens/home/presenation/components/fav_tab/brand_state.dart';
import 'package:calculator/screens/home/presenation/manager/cubit.dart';
import 'package:calculator/screens/home/presenation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_sources/data_sources.dart';
import '../../../domain/entities/CategoriesEntity.dart';

class BrandSelected extends StatelessWidget {
  BrandSelected( {required this.arguments,super.key});
  BrandsArguments arguments;


  static const String routeName = "BrandSelected";

  @override
  Widget build(BuildContext context) {

    //var argu =ModalRoute.of(context)!.settings.arguments as ProductOrBrandsArguments;
    return BlocProvider(
      create: (context) =>
      BrandCubit(HomeRemoteDto())
        ..getProducts(arguments.dataEntity.id ?? '',carIndex),
      child: BlocConsumer<BrandCubit, BrandStates>(
        listener: (context, state) {},
        builder: (context, state) =>
            Scaffold(
              // appBar: AppBar(
              //     title: Text(
              //       dataEntity.name ?? '',
              //   style: TextStyle(color: Colors.amber),
              // )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(BrandCubit
                        .get(context)
                        .products
                        .length,
                            (index) {
                      carIndex=index;
                          return Text(
                              BrandCubit
                                  .get(context)
                                  .products[index].id ?? '');
                        })
                  ],
                ),
              ),
            ),
      ),
    );

  }
}
int carIndex=0;
 class BrandsArguments {
  DataEntity dataEntity;
  int index;
  BrandsArguments(this.dataEntity,this.index);
}


