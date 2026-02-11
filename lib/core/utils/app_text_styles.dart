import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle bold(double size, {Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: size,
      color: color, // null => from Theme (Light/Dark)
    );
  }

  static TextStyle semiBold(double size, {Color? color}) {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: size, color: color);
  }

  static TextStyle medium(double size, {Color? color}) {
    return TextStyle(fontWeight: FontWeight.w500, fontSize: size, color: color);
  }

  static TextStyle regular(double size, {Color? color}) {
    return TextStyle(fontWeight: FontWeight.w400, fontSize: size, color: color);
  }

  static TextStyle bold13({Color? color}) => bold(13, color: color);
  static TextStyle bold23({Color? color}) => bold(23, color: color);
  static TextStyle bold16({Color? color}) => bold(16, color: color);
  static TextStyle bold19({Color? color}) => bold(19, color: color);
  static TextStyle bold28({Color? color}) => bold(28, color: color);

  static TextStyle semiBold11({Color? color}) => semiBold(11, color: color);
  static TextStyle semiBold13({Color? color}) => semiBold(13, color: color);
  static TextStyle semiBold16({Color? color}) => semiBold(16, color: color);
  static TextStyle semiBold19({Color? color}) => semiBold(19, color: color);
  static TextStyle semiBold25({Color? color}) => semiBold(25, color: color);
  static TextStyle semiBold28({Color? color}) => semiBold(28, color: color);

  static TextStyle medium15({Color? color}) => medium(15, color: color);
  static TextStyle medium17({Color? color}) => medium(15, color: color);

  static TextStyle regular11({Color? color}) => regular(11, color: color);
  static TextStyle regular13({Color? color}) => regular(13, color: color);
  static TextStyle regular15({Color? color}) => regular(15, color: color);
  static TextStyle regular22({Color? color}) => regular(22, color: color);
  static TextStyle regular26({Color? color}) => regular(26, color: color);
}
