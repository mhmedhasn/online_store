import 'package:calculator/constants.dart';
import 'package:calculator/screens/home/domain/entities/CategoriesEntity.dart';
import 'package:calculator/screens/home/presenation/components/home_tab/popular_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../size_config.dart';
import '../../manager/cubit.dart';
import '../../manager/states.dart';

import 'discount_banner.dart';
import 'home_header.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeGetProductsErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(state.failures.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return HomeCubit.get(context).categories.isEmpty
            ? Center(child: const CircularProgressIndicator())
            : SafeArea(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenHeight(10)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenWidth(10)),
                      DiscountBanner(),
                      //Categories(),
                      SizedBox(
                        height: getProportionateScreenHeight(200),
                        width: getProportionateScreenWidth(330),
                        child: ImageSlideshow(
                            height: getProportionateScreenHeight(200),
                            width: getProportionateScreenWidth(398),
                            isLoop: true,
                            indicatorColor: AppColors.kPrimaryColor,
                            indicatorBackgroundColor: Colors.white,
                            children: HomeCubit.get(context).sliders.map((i) {
                              return Image.asset(i);
                            }).toList()),
                      ),
                      SizedBox(height: getProportionateScreenWidth(30)),
                      PopularProducts(),
                      SizedBox(height: getProportionateScreenWidth(30)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
