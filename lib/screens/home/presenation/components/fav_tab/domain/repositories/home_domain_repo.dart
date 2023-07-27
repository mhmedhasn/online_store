import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failures.dart';
import '../entities/ProductEntity.dart';

abstract class HomeDomainRepo {


  Future<Either<Failures, ProductEntity>> getProducts(String allProductId);

}
