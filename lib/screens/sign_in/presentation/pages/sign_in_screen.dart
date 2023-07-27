import 'dart:convert';

import 'package:calculator/screens/sign_in/data/data_sources/data_sources.dart';
import 'package:calculator/screens/sign_in/presentation/manager/cubit.dart';
import 'package:calculator/screens/sign_in/presentation/widgets/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/cache_helper.dart';
import '../manager/states.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(RemoteDto()),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pop(context);
            print(json.encode(state.loginEntity.token));
            CacheHelper.saveData(key: "User", value: state.loginEntity.token);
            Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.home,
                arguments: state.loginEntity,
                (route) => false);
          } else if (state is LoginLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
              ),
            );
          } else if (state is LoginErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.failures.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sign In"),
            ),
            body: const BodySignIn(),
          );
        },
      ),
    );
  }
}
