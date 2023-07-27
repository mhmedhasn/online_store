import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/login_entity.dart';
abstract class LoginDomainRepo {
  Future<Either<Failures, LoginEntity>> login(String email, String password);
}
