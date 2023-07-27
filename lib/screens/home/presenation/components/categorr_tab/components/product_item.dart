import 'package:calculator/core/utils/app_colors.dart';
import 'package:calculator/screens/home/presenation/manager/cubit.dart';
import 'package:calculator/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../domain/entities/ProductEntity.dart';


class ProductItem extends StatelessWidget {
  ProductDataEntity model;

  ProductItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(250),
      width: getProportionateScreenWidth(200),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: AppColors.kPrimaryColor.withOpacity(.3), width: 2)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  model.imageCover ?? "",
                  height: getProportionateScreenHeight(128),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      model.title ?? "",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.kPrimaryColor),
                    ),
                    // Text(
                    //   model.description ?? "",
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: GoogleFonts.poppins(
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 14,
                    //       color: AppColors.kPrimaryColor),
                    // ),
                    SizedBox(
                      height:getProportionateScreenHeight(8),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          model.price.toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color:  AppColors.kPrimaryColor),
                        ),
                        SizedBox(
                          width:getProportionateScreenWidth(16),
                        ),
                        Text(
                          (model.price ?? 50 - 50).toString(),
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.lineThrough,
                              decorationColor:
                                   AppColors.kPrimaryColor.withOpacity(.6)
                              // Replace with your desired color
                              ,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.kPrimaryColor.withOpacity(.6)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:getProportionateScreenHeight(8),
                    ),
                    Row(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          'Review (${model.ratingsAverage})',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.kPrimaryColor),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xffFDD835),
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {


                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(Icons.favorite_border),
                    // child: fav
                    //     ? Image.asset('assets/images/Vectorhart_full.png')
                    //     : Image.asset('assets/images/heart.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  HomeCubit.get(context).addTCart(model.id ?? "");
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.kPrimaryColor,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
