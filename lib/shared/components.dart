import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget customFormField({
  double radius = 5.0,
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  required FormFieldValidator validate,
  required String label,
  String? hintText,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? onPressed,
  GestureTapCallback? onTap,
  bool isPassword = false,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      enabled: isClickable,
      validator: validate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: onPressed,
        ),
      ),
    );
Widget defaultButton({
  double? width = double.infinity,
  double? height = 50.0,
  Color? background = Colors.red,
  bool isUpperCase = false,
  required String buttonText,
  double? textSize = 24.0,
  Color? textColor = Colors.white,
  required VoidCallback onPressed,
  double radius = 5,
}) =>
    Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? buttonText.toUpperCase() : buttonText,
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
      ),
    );
