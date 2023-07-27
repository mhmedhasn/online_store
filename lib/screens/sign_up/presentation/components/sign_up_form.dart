import 'package:calculator/screens/sign_up/presentation/Block_manager/sigin_up_provider.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_surfix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
 // final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conformPassword;
  String? phoneNumber;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
     // key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(SignUpCubit.get(context).emailController),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(SignUpCubit.get(context).passwordController),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(
              SignUpCubit.get(context).rePasswordController),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              print("__________________________${conformPassword}${email}${password}");
              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // if all are valid then go to success screen
              //   Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              // }
            },
          ),
        ],
      ),
    );
  }

  Widget buildConformPassFormField(TextEditingController repass) {
    return TextFormField(
      controller: repass,
      onSaved: (newValue) => conformPassword = newValue,

      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error:Constants. kPassNullError);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: Constants.kMatchPassError);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error:Constants. kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error:Constants. kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  Widget buildPasswordFormField(TextEditingController pass) {
    return TextFormField(
      controller: pass,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error:Constants. kPassNullError);
        } else if (value.length >= 8) {
          removeError(error:Constants. kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error:Constants. kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error:Constants. kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  // Widget buildPhoneNumFormField(TextEditingController phone) {
  //   return TextFormField(
  //     controller: phone,
  //     obscureText: true,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kPassNullError);
  //       } else if (value.length >= 11) {
  //         removeError(error: kShortPassError);
  //       }
  //       phoneNumber = value;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kPassNullError);
  //         return "";
  //       } else if (value.length < 8) {
  //         addError(error: kShortPassError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: const InputDecoration(
  //       focusColor: kPrimaryColor,
  //       labelText: "Phone Number",
  //       hintText: "Enter your Phone Number",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: Padding(
  //         padding: EdgeInsets.only(right: 12),
  //         child: Icon(Icons.call,color: Colors.black38),
  //       ),
  //     ),
  //   );
  // }

  Widget buildEmailFormField(TextEditingController emailText) {
    return TextFormField(
      controller: emailText,
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kEmailNullError);
        } else if (Constants.emailValidatorRegExp.hasMatch(value)) {
          removeError(error:Constants. kInvalidEmailError);
        }
        email = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error:Constants. kEmailNullError);
          return "";
        } else if (Constants.emailValidatorRegExp.hasMatch(value)) {
          addError(error:Constants. kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
