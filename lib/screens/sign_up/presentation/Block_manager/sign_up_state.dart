import 'package:calculator/core/error/failures.dart';
import '../../domain/entities/SignUpEntity.dart';

abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  SignUpEntity signUpEntity;

  SignUpSuccessState(this.signUpEntity);
}

class SignUpErrorState extends SignUpStates {
  Failures failures;

  SignUpErrorState(this.failures);
}
