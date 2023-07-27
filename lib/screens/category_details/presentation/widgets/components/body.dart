import 'package:calculator/screens/home/domain/entities/CategoriesEntity.dart';
import 'package:flutter/material.dart';

import '../../../../../components/default_button.dart';
import '../../../../../size_config.dart';
import '../../../../home/domain/entities/ProductEntity.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class CategoryDetailsBody extends StatelessWidget {
  // final Product product;
 final ProductDataEntity  dataEntity;

  const CategoryDetailsBody({Key? key,required this.dataEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(dataEntity:dataEntity ),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: dataEntity,
                pressOnSeeMore: () {},
              ),
              Text(
                dataEntity.brand?.name??"___",
                style: Theme.of(context).textTheme.headline6,
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: dataEntity),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
