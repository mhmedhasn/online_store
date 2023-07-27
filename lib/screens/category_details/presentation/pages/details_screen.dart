import 'package:flutter/material.dart';

import '../../../details/components/custom_app_bar.dart';
import '../../../home/domain/entities/CategoriesEntity.dart';
import '../../../home/domain/entities/ProductEntity.dart';
import '../widgets/components/body.dart';
import '../widgets/components/custom_app_bar.dart';



class CategoryDetailsScreen extends StatelessWidget {

  CategoryDetailsScreen(this.productDataEntity, {super.key});

  ProductDataEntity  productDataEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: DetailsCustomAppBar(rating:productDataEntity ),
      ),
      body: CategoryDetailsBody(dataEntity:productDataEntity ),
    );
  }
}

class ProductOrBrandsArguments {
  DataEntity dataEntity;


  ProductOrBrandsArguments({

    required this.dataEntity,
  });
}
