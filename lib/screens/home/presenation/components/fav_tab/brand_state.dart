


import '../../../../../core/error/failures.dart';
import '../../../domain/entities/ProductEntity.dart';

abstract class BrandStates {}

class BrandInitState extends BrandStates {}

class BrandGetProductsSuccessState extends BrandStates {
  ProductEntity model;

  BrandGetProductsSuccessState(this.model);
}

class BrandGetProductsErrorState extends BrandStates {
  Failures failures;

  BrandGetProductsErrorState(this.failures);
}


class  BrandLoadingState extends BrandStates {}