import 'package:calculator/config/routes/routes.dart';
import 'package:calculator/screens/home/domain/entities/CategoriesEntity.dart';
import 'package:calculator/screens/home/presenation/components/home_tab/special_offers.dart';
import 'package:calculator/screens/home/presenation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/product_card.dart';
import '../../../../../models/Product.dart';
import '../../../../../size_config.dart';
import '../fav_tab/brand_selected.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {




  PopularProducts( {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                HomeCubit.get(context).categories.length,
                (index) {
                  return ProductCard(
                    fit: BoxFit.cover,
                    dataEntityProductCard:
                        HomeCubit.get(context).categories[index],
                  );

                  return const SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SpecialOffers(),
        SizedBox(height: getProportionateScreenWidth(30)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                HomeCubit.get(context).brands.length,
                (index) {
                  return ProductCard(
                    fit: BoxFit.fill,
                    dataEntityProductCard: HomeCubit.get(context).brands[index],
                  );

                  return const SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }

}
