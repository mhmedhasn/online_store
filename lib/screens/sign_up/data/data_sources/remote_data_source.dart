import 'package:calculator/screens/sign_up/data/data_sources/sign_sup_data_sources.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../constants.dart';
import 'package:calculator/core/error/failures.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/user_data.dart';
import '../models/SignUpModel.dart';

class RemoteDataSource implements SignUpDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) async {
    try {
      var response =
          await dio.post("${Constants.baseApiUrl}${EndPoints.signUp}", data: {
        "name": userData.name,
        "email": userData.email,
        "password": userData.password,
        "rePassword": userData.password,
        "phone": userData.phone
      },);

      SignUpModel signUpModel = SignUpModel.fromJson(response.data);
      return Right(signUpModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
