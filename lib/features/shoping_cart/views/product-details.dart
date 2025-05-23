
import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_colors.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final String disc;

  const ProductDetails({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.disc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.arrowback,
            width: 20,
            height: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Product',
          style: AppTextStyle.appbarstylr,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    image,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: SvgPicture.asset(AppAssets.heart),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Vision Alta Men’s Shoes Size (All Colours) Mens\n Starry Sky Printed Shirt 100% Cotton Fabric',
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        height: 1.4,
                        fontWeight: FontWeight.w100,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.loginbtn,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppAssets.minus),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppAssets.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 327,
                      height: 52,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.onboardingbtn,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        label: const Text(
                          'Add to Cart',
                          style: AppTextStyle.catrbtn,
                        ),
                        icon: SvgPicture.asset(
                          AppAssets.cart,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
