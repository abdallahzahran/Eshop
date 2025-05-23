import 'package:ecommerce_shop/core/utils/app_colors.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';



class CustomLaungaugeCardHalf extends StatelessWidget {
  const CustomLaungaugeCardHalf({
    super.key,
    required this.isLeft,
    required this.text,
    this.isSelect = false,
  });
  final bool isLeft;
  final bool isSelect;

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 51,
      decoration: BoxDecoration(
        color: isSelect ? AppColors.loginbtn : Color(0xFFFFCCD5),
        borderRadius: isLeft
            ? BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            : BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.light20(
            color: isSelect
                ? AppColors.white
                :AppColors.categoryTextColor,
          ),
        ),
      ),
    );
  }
}
