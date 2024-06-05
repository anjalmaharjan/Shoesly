import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:shoesly/core/error/exceptions.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';

abstract interface class OrderSummaryRemoteDataSource {
  Future<String> postPayment(PaymentModel paymentModel);
}

class OrderSummaryRemoteDataSourceImpl implements OrderSummaryRemoteDataSource {
  final FirebaseDatabase firebaseDatabase;
  OrderSummaryRemoteDataSourceImpl(this.firebaseDatabase);

  @override
  Future<String> postPayment(PaymentModel paymentModel) async {
    try {
      final ref = firebaseDatabase.ref("payment");
      await ref.set(jsonEncode(paymentModel));
      return "Success";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
