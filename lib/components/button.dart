import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

Widget pillButton(
    {required String text,
    required void Function()? onPressed,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    EdgeInsetsGeometry paddingText = const EdgeInsets.all(0),
    double elevation = 2,
    Color? colorText,
    Color? backGround}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      elevation: elevation,
      backgroundColor: backGround,
      padding: padding,
      shape: const StadiumBorder(),
    ),
    child: Padding(
      padding: paddingText,
      child: Text(
        text,
        style: TextStylesCustom.buttons(color: Colors.black, fontWeightC: FontWeight.bold),
      ),
    ),
  );
}
