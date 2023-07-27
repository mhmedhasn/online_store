
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../size_config.dart';
import '../../manager/cubit.dart';
import '../../manager/states.dart';
import '../home_tab/home_header.dart';
import 'components/product_item.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return HomeCubit.get(context).categories.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                shrinkWrap: true,
                children: HomeCubit.get(context)
                    .products
                    .map((e) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.productDetails,
                          arguments: e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductItem(e),
                    )))
                    .toList(),
              ),
            )
          ],
        );
      },
    );
  }
}
