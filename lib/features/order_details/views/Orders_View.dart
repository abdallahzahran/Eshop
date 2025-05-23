
import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_colors.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:ecommerce_shop/features/order_details/views/ordered_Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  String selectedStatus = "Active";

  final List<Map<String, dynamic>> orders = [
    {
      "name": "Men's T-Shirt",
      "price": 50.0,
      "image": AppAssets.tshirt, // صورة من الـ assets
      "status": "Active"
    },
    {
      "name": "Women’s Jacket",
      "price": 120.0,
      "image": AppAssets.tshirt,
      "status": "Completed"
    },
    {
      "name": "Sports Shoes",
      "price": 75.0,
      "image": AppAssets.tshirt,
      "status": "Canceled"
    },
    {
      "name": "Backpack",
      "price": 45.0,
      "image": AppAssets.tshirt,
      "status": "Active"
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredOrders =
        orders.where((order) => order['status'] == selectedStatus).toList();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            AppAssets.arrowback,
            height: 11,
            width: 11,
            fit: BoxFit.scaleDown,
          ),
        ),
        centerTitle: true,
        title: Text(
          'My Orders',
          style: AppTextStyle.appbarstylr,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildFilterButton("Active", Color(0xFFFFFFFF)),
              buildFilterButton("Completed", Color(0xFFFFFFFF)),
              buildFilterButton("Canceled", Color(0xFFFFFFFF)),
            ],
          ),
          Expanded(
            child: filteredOrders.isEmpty
                ? Center(
                    child: Text(
                      "You don't have any $selectedStatus orders at this time",
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      return OrderItem(order: filteredOrders[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterButton(String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedStatus = status;
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: color,
          backgroundColor: selectedStatus == status
              ? AppColors.loginbtn
              : Color(0XFFFFCCD5),
        ),
        child: Text(
          status,
        ),
      ),
    );
  }
}
