import 'package:calculator/screens/home/domain/entities/CategoriesEntity.dart';
import 'package:calculator/screens/home/presenation/manager/cubit.dart';
import 'package:calculator/screens/home/presenation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_colors.dart';

import '../../size_config.dart';
import 'data/data_sources/data_sources.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

DataEntity dataEntity=DataEntity();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => HomeCubit(HomeRemoteDto())..getCategories()..getBrands(),

      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetProductsErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.failures.message),
              ),
            );
          }
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeGetCategoriesSuccessState) {}
        },
        builder: (context, state) {
          return  Scaffold(
            body: HomeCubit.get(context).tabs[HomeCubit.get(context).bottomNavIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              showSelectedLabels: false,
              unselectedItemColor: AppColors.kSecondaryColor,
              selectedItemColor:AppColors.kPrimaryColor ,
              currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                HomeCubit.get(context).changeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(

                    icon: Icon(Icons.home),
                    label: "",
                    backgroundColor:AppColors.kPrimaryLightWhiteColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    label: "",
                    backgroundColor: AppColors.kPrimaryLightWhiteColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: "",
                    backgroundColor:AppColors.kPrimaryLightWhiteColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "",
                    backgroundColor: AppColors.kPrimaryLightWhiteColor),
              ],
            ),
          );
        },

      ),
    );
  }
}
