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
      await sendNotification(paymentModel);
      return "Success";
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> sendNotification(PaymentModel paymentModel) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      print(fcmToken);
      final uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
      final response = await http.post(
        uri,
        body: jsonEncode({
          "token": "bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
          "notification": {
            "title": "Payment success",
            "body": "Thank you for ordering.}"
          },
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response.body);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
