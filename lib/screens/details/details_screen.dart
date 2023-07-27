import 'package:flutter/material.dart';

import '../../models/Product.dart';
import '../home/domain/entities/CategoriesEntity.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
DetailsScreen(this.dataEntity, {super.key});

DataEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating:dataEntity ),
      ),
      body: Body(dataEntity:dataEntity ),
    );
  }
}

class ProductOrBrandsArguments {
  DataEntity dataEntity;


  ProductOrBrandsArguments({

    required this.dataEntity,
  });
}
