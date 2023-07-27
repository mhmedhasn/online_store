import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/default_button.dart';
import '../../../../components/socal_card.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components.dart';
import '../../../../size_config.dart';
import '../../../sign_in/presentation/manager/cubit.dart';
import '../Block_manager/sigin_up_provider.dart';
import 'sign_up_form.dart';

class BodyUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Register Account", style: headingStyle),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                defaultFormField(
                    icon: const Icon(Icons.drive_file_rename_outline),
                    controller: SignUpCubit.get(context).nameController,
                    label: "Full name",
                    validate: (value) {
                      return null;
                    }),
                SizedBox(
                  height: getProportionateScreenHeight(12),
                ),
                defaultFormField(
                    icon: Icon(Icons.numbers_outlined),
                    controller: SignUpCubit.get(context).phoneController,
                    label: "Phone Number",
                    validate: (value) {
                      return null;
                    }),
                SizedBox(
                  height:  getProportionateScreenHeight(12),
                ),
                defaultFormField(
                    icon: Icon(Icons.email_outlined),
                    controller: SignUpCubit.get(context).emailController,
                    label: "Email",
                    validate: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value == null || value.isEmpty || !emailValid) {
                        return "Please Enter valid Email Address";
                      }
                      return null;
                    }),
                SizedBox(height: getProportionateScreenHeight(12),),
                defaultFormField(

                    icon: Icon(Icons.password_outlined),

                    controller: SignUpCubit.get(context).passwordController,
                    label: "Password",
                    validate: (value) {
                      return null;
                    },
                    isPassword: true
                ),
                SizedBox(height: getProportionateScreenHeight(12),),
                defaultFormField(

                    icon: Icon(Icons.password_outlined),

                    controller: SignUpCubit.get(context).rePasswordController,
                    label: "Password",
                    validate: (value) {
                      return null;
                    },
                    isPassword: true
                ),
                SizedBox(height: getProportionateScreenHeight(12),),

                DefaultButton(   text: "Continue",
                  press: () {
                    SignUpCubit.get(context).signUp();
                  },),
                SizedBox(height: getProportionateScreenHeight(12),),
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
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
