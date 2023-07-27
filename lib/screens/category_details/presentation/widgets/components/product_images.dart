import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../size_config.dart';
import '../../../../home/domain/entities/CategoriesEntity.dart';
import '../../../../home/domain/entities/ProductEntity.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.dataEntity,
  }) : super(key: key);
  final ProductDataEntity dataEntity;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.dataEntity.id.toString(),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(widget.dataEntity.images![selectedImage]),),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.dataEntity.images!.length,
                    (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColors.kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image(
            image: NetworkImage(  widget.dataEntity.images![index])
         ),
      ),
    );
  }
}
