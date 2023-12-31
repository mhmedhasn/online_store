import 'package:calculator/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/SignUpEntity.dart';
import '../entities/user_data.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData);
}
