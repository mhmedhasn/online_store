import 'package:bloc/bloc.dart';
import 'package:calculator/screens/home/domain/repositories/home_domain_repo.dart';
import 'package:calculator/screens/home/presenation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_sources/data_sources.dart';
import '../../../data/repositories/home_data_repo.dart';
import '../../../domain/entities/ProductEntity.dart';
import '../../../domain/use_cases/get_products_use_case.dart';
import 'brand_state.dart';

class  BrandCubit extends Cubit<BrandStates>{
  late HomeDomainRepo homeDomainRepo;
  HomeDataSources homeDataSources;
  BrandCubit(this.homeDataSources) : super(BrandInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }
  static BrandCubit get(context) => BlocProvider.of(context);
  List<ProductDataEntity> products = [];

  getProducts(String allProductId,int index) async {
    List<String> ids =[];
    ids.add(products[index].id??'');
    print("++++++++++++++++++++++++$ids");
    emit(BrandLoadingState());
    GetProductsUseCase productsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await productsUseCase.call(allProductId);
    result.fold((l) {
      emit(BrandGetProductsErrorState(l));
    }, (r) {


      print(products.length.toString());

      emit(BrandGetProductsSuccessState(r));
    });
  }


}