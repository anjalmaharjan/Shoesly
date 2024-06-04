import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/error/exceptions.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';
import "package:http/http.dart" as http;

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
      sendNotification(paymentModel);
      return "Success";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> sendNotification(PaymentModel paymentModel) async {
    try {
      final fcmToken = FirebaseMessaging.instance.getToken();
      final uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
      await http.post(uri,
          body: jsonEncode({
            "to": fcmToken,
            "notification": {
              "title": "Payment success",
              "body":
                  "Thank you for ordering your total cost is${paymentModel.grandTotal}"
            },
          }),
          headers: {
            "Content-Type": "application/json",
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
