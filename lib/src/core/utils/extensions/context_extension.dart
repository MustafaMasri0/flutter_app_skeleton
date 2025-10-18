import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  EdgeInsetsGeometry get padding => MediaQuery.paddingOf(this);

  EdgeInsetsGeometry get viewInsets => MediaQuery.viewInsetsOf(this);

  Size get size => MediaQuery.sizeOf(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  void showSnakBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }
}
