import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';


class RoundedInputTextField extends StatelessWidget {
  const RoundedInputTextField({
    required this.textController,
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      controller: textController,
      onChanged: onChanged,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: AppColors.kPrimaryColor,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
    ));
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
