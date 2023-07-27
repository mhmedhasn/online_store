
import 'package:calculator/screens/home/presenation/components/categorr_tab/category_tab.dart';
import 'package:calculator/screens/home/presenation/components/fav_tab/fav_tab.dart';
import 'package:calculator/screens/home/presenation/components/home_tab/body.dart';
import 'package:calculator/screens/home/presenation/components/profile_tab/components/body.dart';
import 'package:calculator/screens/home/presenation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_images.dart';
import '../../data/data_sources/data_sources.dart';
import '../../data/repositories/home_data_repo.dart';
import '../../domain/entities/CategoriesEntity.dart';
import '../../domain/entities/ProductEntity.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../../domain/use_cases/add_cart_use_case.dart';
import '../../domain/use_cases/get_brands_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);
  int indexItem=0;
  int bottomNavIndex = 0;
  int numOfItemsInCart = 0;
  List<Widget> tabs =  [HomeBody(),CategoryTab(),FavTab(), ProfileBody(), ];

  List<DataEntity> categories = [];
  List<DataEntity> brands = [];
  List<ProductDataEntity> products = [];

  List<String> sliders = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  void changeBottomNav(int index) {
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }

  void addTCart(String productId) async {
    emit(AddToCartLoadingState());
    AddCartUseCase addCartUseCase = AddCartUseCase(homeDomainRepo);
    var result = await addCartUseCase.call(productId);
    result.fold((l) {
      emit(AddToCartErrorState(l));
    }, (r) {
      numOfItemsInCart = r.numOfCartItems ?? 0;
      emit(AddToCartSuccessState(r));
    });
  }

  getProducts(String allProductId) async {
    emit(HomeLoadingState());
    GetProductsUseCase productsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await productsUseCase.call(allProductId);
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      products = r.data ?? [];
      print(products.length.toString());
      emit(HomeGetProductsSuccessState(r));
    });
  }

  getBrands() async {
    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  getCategories() async {
    emit(HomeLoadingState());
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }
}
