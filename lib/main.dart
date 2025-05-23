import 'package:ecommerce_shop/core/cache/cache_helper.dart';
import 'package:ecommerce_shop/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  try {
    runApp(const MyApp());
  } catch (e, s) {
    print("🔥 Exception: $e");
    print("📌 StackTrace: $s");
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(), 
    );
  }
}

