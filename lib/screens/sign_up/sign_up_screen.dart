import 'package:calculator/constants.dart';
import 'package:calculator/screens/sign_up/presentation/Block_manager/sigin_up_provider.dart';
import 'package:calculator/screens/sign_up/presentation/Block_manager/sign_up_state.dart';
import 'package:calculator/screens/sign_up/presentation/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/routes.dart';
import '../../core/utils/app_colors.dart';
import 'data/data_sources/remote_data_source.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(RemoteDataSource()),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    backgroundColor:AppColors. kPrimaryColor,
                  ),
                ),
              ),
            );
          } else if (state is SignUpErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures.message ?? ""),
              ),
            );
          } else if (state is SignUpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.home, (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Sign Up"),
            ),
            body: BodyUp(),
          );
        },
      ),
    );
  }
}
