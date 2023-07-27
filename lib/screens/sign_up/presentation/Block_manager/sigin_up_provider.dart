
import 'package:calculator/screens/sign_up/presentation/Block_manager/sign_up_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/sign_sup_data_sources.dart';
import '../../data/repositories/sign_up_data_repo.dart';
import '../../domain/entities/user_data.dart';
import '../../domain/repositories/sign_up_domain_repo.dart';
import '../../domain/use_cases/sign_up_use_case.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSources sources;

  SignUpCubit(this.sources) : super(SignUpInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  void signUp() async {
    emit(SignUpLoadingState());
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(sources);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    UserData userData = UserData(
        name: "hamdfouda",
        phone: "01110255554",
        password: "122jk3@Hesham",
        email: "hesham5wifoyukghd88@gmail.com",
        rePassword: '122jk3@Hesham');

    var result = await signUpUseCase.call(userData);
    result.fold((l) {
      emit(SignUpErrorState(l));
    }, (r) {
      emit(SignUpSuccessState(r));
    });
  }
}
