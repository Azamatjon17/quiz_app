import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/constants/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle s15w4cP =
      GoogleFonts.golosText(fontSize: 15, fontWeight: FontWeight.w400,color: AppColors.purpule);
  static TextStyle s15w4cB =
      GoogleFonts.golosText(fontSize: 15, fontWeight: FontWeight.w400);
  static TextStyle s20w6cB =
      GoogleFonts.golosText(fontSize: 20, fontWeight: FontWeight.w600);
}
