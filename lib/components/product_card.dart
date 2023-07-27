import 'package:calculator/screens/home/domain/entities/CategoriesEntity.dart';
import 'package:calculator/screens/home/presenation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/routes/routes.dart';
import '../constants.dart';

import '../core/utils/app_colors.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  final double width, aspectRetio;
   final DataEntity dataEntityProductCard;
  BoxFit fit;

  ProductCard(
      {Key? key,
      required this.fit,
      this.width = 140,
      this.aspectRetio = 1.02,
      // required this.product,
      required this.dataEntityProductCard

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             AspectRatio(
                  aspectRatio: 1.02,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image border
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color:AppColors. kSecondaryColor.withOpacity(0.1),
                      ),
                      child: Hero(
                          tag: dataEntityProductCard?.id ?? 0.toString(),
                          child: Image(
                            image:
                                NetworkImage(dataEntityProductCard?.image ?? ''),
                            width: double.infinity,
                            fit: fit,
                          )),
                    ),
                  ),
                ),
            const SizedBox(height: 10),
            Text(
              dataEntityProductCard?.name ?? '------',
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Flexible(
                    child: Text(
                      overflow: TextOverflow.visible,
                      "${dataEntityProductCard?.slug ?? '0.0'}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: FontWeight.w200,
                        color:AppColors. kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor.withOpacity(0.15),
                      //: kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: Color(0xFFFF4848),
                      // : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
