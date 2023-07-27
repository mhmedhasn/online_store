import 'package:calculator/screens/sign_up/data/data_sources/sign_sup_data_sources.dart';
import 'package:dartz/dartz.dart';
import 'package:calculator/core/error/failures.dart';
import '../../domain/entities/user_data.dart';
import '../models/SignUpModel.dart';

class LocalDataSource implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
