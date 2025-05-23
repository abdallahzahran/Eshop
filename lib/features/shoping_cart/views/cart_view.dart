import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_colors.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Women’s Casual Wear ',
      price: 34.0,
      oldPrice: 50.0,
      rating: 4.5,
      quantity: 1,
      image: AppAssets.cart1,
    ),
    CartItem(
      name: 'Men’s Jacket ',
      price: 45.0,
      oldPrice: 60.0,
      rating: 4.2,
      quantity: 2,
      image: AppAssets.cart2,
    ),
  ];

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void increaseQuantity(CartItem item) {
    setState(() => item.quantity++);
  }

  void decreaseQuantity(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        cartItems.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: AppTextStyle.appbarstylr),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            AppAssets.arrowback,
            width: 11,
            height: 11,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body:
          cartItems.isEmpty
              ? Center(child: Text('Your cart is empty!'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shopping List',
                        style: TextStyle(
                          fontFamily: AppAssets.fontfamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return CartItemWidget(
                            item: item,
                            onIncrease: () => increaseQuantity(item),
                            onDecrease: () => decreaseQuantity(item),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    CheckoutSection(totalPrice: totalPrice),
                  ],
                ),
              ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final double oldPrice;
  final double rating;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.quantity,
    required this.image,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331,
      height: 191,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: -8,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                item.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '\$${item.oldPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      item.rating.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: onDecrease,
                child: SvgPicture.asset(AppAssets.minus),
              ),
              SizedBox(width: 5),
              Text(
                item.quantity.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppAssets.fontfamily,
                  fontWeight: FontWeight.w300,
                  color: AppColors.carttext,
                ),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: onIncrease,
                child: SvgPicture.asset(AppAssets.add),
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

class CheckoutSection extends StatelessWidget {
  final double totalPrice;

  const CheckoutSection({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SummaryRow(title: 'Subtotal', value: totalPrice),
          SummaryRow(title: 'Tax and Fees', value: 3.0),
          SummaryRow(title: 'Delivery Fee', value: 2.0),
          Divider(color: Color(0xFFCACACA), thickness: 1.0),
          SummaryRow(
            title: 'Order Total',
            value: totalPrice + 5.0,
            isTotal: true,
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 327,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.onboardingbtn,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text('Checkout', style: AppTextStyle.catrbtn),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String title;
  final double value;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: isTotal ? FontWeight.w400 : FontWeight.normal,
              color: AppColors.carttext,
            ),
          ),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
