import 'package:calculator/components/default_button.dart';
import 'package:calculator/core/utils/app_colors.dart';
import 'package:calculator/screens/sign_in/presentation/manager/cubit.dart';
import 'package:calculator/screens/sign_in/presentation/widgets/components/rounded_input_text_field.dart';
import 'package:calculator/screens/sign_in/presentation/widgets/components/rounded_password_field.dart';
import 'package:flutter/material.dart';

import '../../../../../components/no_account_text.dart';
import '../../../../../components/socal_card.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../size_config.dart';
import 'sign_form.dart';

class BodySignIn extends StatelessWidget {
  const BodySignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                RoundedInputTextField(
                    textController: LoginCubit.get(context).emailController,
                    hintText: "Enter your email",
                    onChanged: (value) {

                    },),
                RoundedPasswordField(
                  textController:  LoginCubit.get(context).passwordController,
                  onChanged: (value) {},
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  children: [

                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.forgotPasswordScreen),
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),

                DefaultButton(   text: "Continue",
                  press: () {
                    LoginCubit.get(context).login();
                  },),
                SizedBox(height: SizeConfig.screenHeight * 0.08),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
