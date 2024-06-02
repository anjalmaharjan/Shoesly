import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService {
  static final FirebaseDatabaseService _firebaseDatabaseService =
      FirebaseDatabaseService._internal();

  factory FirebaseDatabaseService() {
    return _firebaseDatabaseService;
  }

  FirebaseDatabaseService._internal();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getRequests() async {
    try {
      await firebaseFirestore.collection('shoes').add({"name": ""});
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
