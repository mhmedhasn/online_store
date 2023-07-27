import 'package:dartz/dartz.dart';
import 'package:calculator/core/error/failures.dart';
import '../../domain/entities/SignUpEntity.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/sign_up_domain_repo.dart';
import '../data_sources/sign_sup_data_sources.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;

  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) =>
      sources.signUp(userData);
}
