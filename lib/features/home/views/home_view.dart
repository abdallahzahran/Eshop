import 'package:ecommerce_shop/core/helper/my_navigator.dart';
import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_colors.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:ecommerce_shop/core/widgets/Custom_app_bar.dart';
import 'package:ecommerce_shop/core/widgets/custom_categories_section.dart';
import 'package:ecommerce_shop/core/widgets/custom_promo_slider.dart';
import 'package:ecommerce_shop/core/widgets/custom_search_bar.dart';
import 'package:ecommerce_shop/features/profile/view/profile_view.dart';
import 'package:ecommerce_shop/features/shoping_cart/views/cart_view.dart';
import 'package:ecommerce_shop/features/shoping_cart/views/recent_product.dart';
import 'package:ecommerce_shop/features/shoping_cart/views/shoping_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenBodyContent(),
    const ShopingView(),
      const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: InkWell(
        onTap: () {
          MyNavigator.goTo(screen: CartView());
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.loginbtn,
            borderRadius: BorderRadius.circular(40),
          ),
          child: SvgPicture.asset(
            AppAssets.bag,
            width: 32,
            height: 32,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: 375,
        height: 76,
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFFF83758),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _buildSvgIcon(AppAssets.home, 0, _currentIndex),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _buildSvgIcon(AppAssets.cart, 1, _currentIndex),
              label: "Items",
            ),
            BottomNavigationBarItem(
              icon: _buildSvgIcon(AppAssets.profile, 2, _currentIndex),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBodyContent extends StatelessWidget {
  const HomeScreenBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomAppBar(),
          const CustomSearchBar(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('All Featured', style: AppTextStyle.allFeathureStyle),
            ),
          ),
          const SizedBox(height: 20),
          CustomCategoriesSection(),
          const SizedBox(height: 20),
          const CustomPromoSlider(),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recommended',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 22 / 18,
                letterSpacing: 0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          RecentProducts(),
        ],
      ),
    );
  }
}

Widget _buildSvgIcon(String assetPath, int index, int currentIndex) {
  return SvgPicture.asset(
    assetPath,
    width: 24,
    height: 24,
    colorFilter: ColorFilter.mode(
      currentIndex == index ? const Color(0xFFF83758) : Colors.black,
      BlendMode.srcIn,
    ),
  );
}
