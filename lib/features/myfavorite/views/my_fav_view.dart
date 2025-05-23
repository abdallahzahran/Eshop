
import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:ecommerce_shop/features/shoping_cart/views/recent_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MyFavView extends StatelessWidget {
  const MyFavView({super.key});

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
          'My Favorites',
          style: AppTextStyle.appbarstylr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            children: [RecentProducts()],
          ),
        ),
      ),
    );
  }
}
