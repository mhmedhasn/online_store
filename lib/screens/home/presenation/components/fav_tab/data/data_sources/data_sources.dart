import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../../constants.dart';
import '../../../../../../../core/api/end_points.dart';
import '../../../../../../../core/error/failures.dart';
import '../models/ProductModel.dart';

abstract class HomeDataSources {


  Future<Either<Failures, ProductModel>> getProducts(String allProductId);

}

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

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

}

class HomeLocalDto implements HomeDataSources {

  @override
  Future<Either<Failures, ProductModel>> getProducts(String allProductId) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }


}
