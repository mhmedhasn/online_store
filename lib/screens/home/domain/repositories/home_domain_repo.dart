import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/CartReponse.dart';
import '../entities/CategoriesEntity.dart';
import '../entities/ProductEntity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();

  Future<Either<Failures, ProductEntity>> getProducts(String allProductId);

  Future<Either<Failures, CartResponse>> addToCart(String productId);
}
