import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle poppins20W600() => GoogleFonts.poppins(
    fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primary);

TextStyle poppins14W300({Color color = AppColors.primary}) =>
    GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w300, color: color);

TextStyle poppins14W400() => GoogleFonts.poppins(
    fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primary);

TextStyle poppins12W400() => GoogleFonts.poppins(
    fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.primary);

TextStyle poppins18W500() => GoogleFonts.poppins(
    fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.primary);
