// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecommerce_shop/core/utils/app_assets.dart';


class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.obscureText = false,
  });
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 317,
      height: 55,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          suffixIcon:
              hintText == 'Password'
                  ? SvgPicture.asset(AppAssets.eye, fit: BoxFit.scaleDown)
                  : suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: Color(0xFFF3F3F3),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF676767)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA8A8A9)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA8A8A9)),
          ),
        ),
      ),
    );
  }
}
