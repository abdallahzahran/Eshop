import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/Custom_Laungauge_Card_Half.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            AppAssets.arrowback,
            fit: BoxFit.scaleDown,
          ),
        ),
        centerTitle: true,
        title: Text(
          'settings',
          style: AppTextStyle.appbarstylr,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: AppTextStyle.light20(),
                ),
                Row(
                  children: [
                    CustomLaungaugeCardHalf(
                      isLeft: true,
                      text: "AR",
                    ),
                    CustomLaungaugeCardHalf(
                      isLeft: false,
                      isSelect: true,
                      text: "EN",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
