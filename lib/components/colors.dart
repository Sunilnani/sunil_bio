import 'package:flutter/material.dart';

class CustomColors {
  static Map<int, Color> primarySwatchColorMap = {
    50: Color.fromRGBO(23, 43, 77, .1),
    100: Color.fromRGBO(23, 43, 77, .2),
    200: Color.fromRGBO(23, 43, 77, .3),
    300: Color.fromRGBO(23, 43, 77, .4),
    400: Color.fromRGBO(23, 43, 77, .5),
    500: Color.fromRGBO(23, 43, 77, .6),
    600: Color.fromRGBO(23, 43, 77, .7),
    700: Color.fromRGBO(23, 43, 77, .8),
    800: Color.fromRGBO(23, 43, 77, .9),
    900: Color.fromRGBO(23, 43, 77, 1),
  };
  static MaterialColor primarySwatchColor = MaterialColor(0xFF172B4D, primarySwatchColorMap);


  static Color textLightColor = Color(0xFF5E6C84);
  static Color textDarkColor = Color(0xFF172B4D);
  static Color buttonColor=Color(0xFF1F4D89);
  static Color dangerColor = Color(0xFFCD3426);
  static Color cardBgColor = Color(0xFFF4F5F7);
  static Color successBgColor = Color(0xFFB3FFB1);

  static Color successTextColor = Color(0xFF036700);
  static Color deliveryBgColor = Color(0xFFC7D9FF);
  static Color deliveryTextColor = Color(0xFF00226B);
  static Color cancelBgColor = Color(0xFFFFC1C1);
  static Color cancelTextColor = Color(0xFFA40000);

  static Color backgroundGreyColor = Color(0xFFD9D9D9);
  static Color darkBackGroundGrey= Color(0xFFA7A7A7);
  static Color lightBlueBgColor= Color(0xFFCCE0FF);
  static Color lightBlueTextColor= Color(0xFF1F4D8A);



  static TextStyle Large24textDarkColor = const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Color(0xFF172B4D));
  static TextStyle titleTextColor = const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF172B4D));

  static TextStyle Large16textDarkColor = const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Color(0xFF172B4D));
  static TextStyle Medium14textDarkColor = const  TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF172B4D));
  static TextStyle Large28textLightColor = const TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: Color(0xFF5E6C84));
  static TextStyle Large32textDarkColor = const TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Color(0xFF172B4D));
  static TextStyle Medium12textLightColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xFF5E6C84));
  static TextStyle Medium12textDarkColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xFF172B4D));
  static TextStyle Medium14textLightColor = const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFF5E6C84));

  static TextStyle low12textLightColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF5E6C84));
  static TextStyle low12textdarkColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF172B4D));

  static TextStyle medium12successTextColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF036700));

  static TextStyle Medium10textLightColor = const TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Color(0xFF5E6C84));

  static TextStyle Medium12textLightBlueColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFFCCE0FF));

  static TextStyle Medium12textBlackColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black);
  static TextStyle light12textblueColor = const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF1F4D8A));

  static TextStyle Medium14WhiteColor = const  TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white);
}