import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failures.dart';

import '../../domain/entities/ProductEntity.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../data_sources/data_sources.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);


  @override
  Future<Either<Failures, ProductEntity>> getProducts(String allProductId) {
    return homeDataSources.getProducts(allProductId);
  }


}
