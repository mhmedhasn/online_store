import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import 'rounded_input_text_field.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    required this.textController,
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController textController;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    bool obscureText =true;
    return TextFieldContainer(
      child: TextFormField(
        controller: textController,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: AppColors.kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: AppColors.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
