import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/constants.dart';
import '../models/CartReponse.dart';
import '../models/CategoryOrBrandModel.dart';
import '../models/ProductModel.dart';

abstract class HomeDataSources {
  Future<Either<Failures, CategoryOrBrandModel>> getBrands();

  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, ProductModel>> getProducts(String allProductId);

  Future<Either<Failures, CartResponse>> addToCart(String productId);
}

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllBrands}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllCategories}",
      );
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts(String allProductId) async {
    try {
      var response = await dio.get(
        "${Constants.baseApiUrl}${EndPoints.getAllProducts}",
        data: {"brand":allProductId}
      );
      ProductModel model = ProductModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) async {
    var userToken = CacheHelper.getData("User");
    try {
      var response = await dio.post(
          "${Constants.baseApiUrl}${EndPoints.addToCart}",
          options: Options(headers: {"token": userToken}),
          data: {"productId": productId});
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class HomeLocalDto implements HomeDataSources {
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts(String allProductId) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }
}
