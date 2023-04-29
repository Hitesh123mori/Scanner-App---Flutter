import 'package:flutter/material.dart';

hexStringToColors(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}


class AppColors {
  static Map theme = themes["theme1"];

  static Map themes = {
    "theme1": {
      "primaryColor": hexStringToColors("##000000"),
      "secondaryColor": hexStringToColors("#393053"),
      "tertiaryColor": hexStringToColors("#635985")
    },
    "theme2": {
      "primaryColor": hexStringToColors("##000000"),
      "secondaryColor": hexStringToColors("#393053"),
      "tertiaryColor": hexStringToColors("#635985")
    }
    };


}