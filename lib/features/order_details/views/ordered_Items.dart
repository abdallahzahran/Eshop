import 'package:ecommerce_shop/core/utils/app_colors.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338,
      height: 106,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 103,
            height: 106,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(order['image']),
                  fit: BoxFit.cover,
                )),
          ),

          const SizedBox(width: 12),

          /// تفاصيل الطلب
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// العنوان والسعر
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(order['name'],
                          style: AppTextStyle.light10(),
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text("\$${order['price']}",
                        style: AppTextStyle.light10()
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),

                /// التاريخ وعدد القطع
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("15/05/2005 1:30 pm",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text("1 item",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 103,
                        height: 21,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.white,
                            backgroundColor: AppColors.onboardingbtn,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: AppTextStyle.customTextStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        width: 103,
                        height: 21,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.white,
                            backgroundColor: AppColors.onboardingbtn,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Track Driver",
                            style: AppTextStyle.customTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
