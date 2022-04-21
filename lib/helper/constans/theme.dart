import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color whiteColor = Color(0xffFFFFFF);
const Color blackColor = Color(0xff222222);
const Color greyColor = Color(0xffBEBFCA);
const Color greenColor = Color(0xff138F87);

final TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
final TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);
final TextStyle whiteLightTextStyle =
    GoogleFonts.poppins(color: whiteColor.withOpacity(0.60));
final TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
final TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);

const FontWeight light = FontWeight.w300;
const FontWeight reguler = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight black = FontWeight.w900;

const double defaultMargin = 20.0;
const double secondaryMargin = 30.0;
