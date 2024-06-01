import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/firebase/firebase_messaging_service.dart';
import 'package:shoesly/core/firebase/firebase_options.dart';
import 'package:shoesly/core/routes.dart';
import 'package:shoesly/core/theme/app_theme.dart';
import 'package:shoesly/feature/cart/presentation/pages/cart_page.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_page.dart';
import 'package:shoesly/feature/order_summary/presentation/pages/oerder_summary_page.dart';
import 'package:shoesly/feature/product_detail/presentation/pages/product_detail_page.dart';
import 'package:shoesly/feature/product_filter/presentation/pages/product_filter_page.dart';
import 'package:shoesly/feature/product_review/presentation/pages/product_review_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessagingService().requestPersmission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoesly',
      theme: AppTheme.lightThemeMode,
      home: const DiscoverPage(),
      routes: {
        AppRoutes.discover: (context) => const DiscoverPage(),
        AppRoutes.productDetail: (context) => const ProductDetailPage(),
        AppRoutes.cart: (context) => const CartPage(),
        AppRoutes.productFilter: (context) => const ProductFilterPage(),
        AppRoutes.productReview: (context) => const ProductReviewPage(),
        AppRoutes.orderSummary: (context) => const OrderSummaryPage(),
      },
    );
  }
}
