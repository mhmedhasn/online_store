import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants.dart';
import '../../../core/utils/app_colors.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../home/domain/entities/CategoriesEntity.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.dataEntity,
  }) : super(key: key);
  final DataEntity dataEntity;

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
          child: AspectRatio(
            aspectRatio: 1,
            child: Image(
              height: getProportionateScreenHeight(200),
              width:getProportionateScreenWidth(238),
              image: NetworkImage(widget.dataEntity.image ?? ''),fit: BoxFit.fill,
            ),
          ),
        ),
         SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildSmallProductPreview()],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage;
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
          border: Border.all(color: AppColors.kPrimaryColor),
        ),
        child: Image(
          image: NetworkImage(widget.dataEntity.image ?? ''),
        ),
      ),
    );
  }
}
