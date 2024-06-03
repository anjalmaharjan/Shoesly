import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly/feature/cart/presentation/pages/cart_page.dart';
import 'package:shoesly/feature/discover/data/datasources/discover_remote_data_source.dart';
import 'package:shoesly/feature/discover/data/repository/discover_repository_impl.dart';
import 'package:shoesly/feature/discover/domain/usecases/discover_product.dart';
import 'package:shoesly/feature/discover/presentation/cubit/discover_cubit.dart';
import 'package:shoesly/feature/discover/presentation/pages/discover_page.dart';
import 'package:shoesly/feature/order_summary/presentation/pages/order_summary_page.dart';
import 'package:shoesly/feature/product_detail/presentation/pages/product_detail_page.dart';
import 'package:shoesly/feature/product_filter/presentation/pages/product_filter_page.dart';
import 'package:shoesly/feature/product_review/presentation/pages/product_review_page.dart';
import 'package:shoesly/init_dependencies.dart';
import 'core/core.dart';
import 'feature/product_detail/presentation/cubit/product_detail_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessagingService().requestPersmission();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailCubit>(
          create: (context) => ProductDetailCubit(),
        ),
        BlocProvider(
          create: (context) => DiscoverCubit(
            discoverProduct: DiscoverProductUsecase(
              DiscoverRepositoryImpl(
                DiscoverRemoteDataSourceImpl(FirebaseFirestore.instance),
              ),
            ),
          )..fetchDiscoverProducts(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
