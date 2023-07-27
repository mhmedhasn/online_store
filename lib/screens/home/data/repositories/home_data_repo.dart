import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/CategoriesEntity.dart';
import '../../domain/entities/ProductEntity.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../data_sources/data_sources.dart';
import '../models/CartReponse.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() {
    return homeDataSources.getBrands();
  }

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() {
    return homeDataSources.getCategories();
  }

  @override
  Future<Either<Failures, ProductEntity>> getProducts(String allProductId) {
    return homeDataSources.getProducts(allProductId);
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    return homeDataSources.addToCart(productId);
  }
}
