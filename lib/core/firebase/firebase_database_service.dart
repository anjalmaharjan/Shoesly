import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  static final FirebaseDatabaseService _firebaseDatabaseService =
      FirebaseDatabaseService._internal();

  factory FirebaseDatabaseService() {
    return _firebaseDatabaseService;
  }

  FirebaseDatabaseService._internal();

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Map brandLogo = {
    "Addidas":
        "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/logo%2FSubtract.svg?alt=media&token=b01ce6a0-1369-46dc-85f1-5129445f33c8",
    "Reebok":
        "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/logo%2FVector-1.svg?alt=media&token=94cef8d8-c435-41bf-a0c8-8b878fedbf5c",
    "Jordan":
        "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/logo%2FBrand.svg?alt=media&token=63de0cd5-a52b-4735-ae46-0a7dada10588",
    "Vans":
        "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/logo%2FVector-2.svg?alt=media&token=5ee3471b-3180-4e5a-81bf-b127b3913294",
    "Puma":
        "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/logo%2FVector-3.svg?alt=media&token=cd4fba30-f825-4b6b-9801-6e81ec8302f0",
    "Nike":
        "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/logo%2FVector.svg?alt=media&token=42cbc347-c43c-4c6d-9a3d-7ab3c9dc34ee"
  };

  Future<void> getRequests() async {
    try {
      await firebaseFirestore.collection('shoes').add(
        {
          "id": 1,
          "name": "Vans 10",
          "brand": "Vans",
          "rating": 5,
          "description": "asdfasdfasd",
          "size": [39, 40, 41, 42, 43],
          "price": 500.00,
          "brandLogo": brandLogo['Vans'],
          "shippingCost": 55,
          "image":
              "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/shoes_images%2Fimage%2027.png?alt=media&token=b109e26a-2da9-4cc6-9ec7-9850cf4f04f2",
          "review": [
            {
              "name": "asdfasd",
              "description": "asdfasdfasdfasdf",
              "rating": 5,
              "image":
                  "https://plus.unsplash.com/premium_photo-1706727289737-f82ef8dfb3a9?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            },
            {
              "name": "asdfasd",
              "description": "asdfasdfasdfasdf",
              "rating": 4,
              "image":
                  "https://images.unsplash.com/photo-1716059491562-4422a814d8f1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            },
            {
              "name": "asdfasd",
              "description": "asdfasdfasdfasdf",
              "rating": 2,
              "image":
                  "https://plus.unsplash.com/premium_photo-1715876268987-43d3d9621815?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            },
            {
              "name": "asdfasd",
              "description": "asdfasdfasdfasdf",
              "rating": 2,
              "image":
                  "https://plus.unsplash.com/premium_photo-1715876268987-43d3d9621815?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            },
            {
              "name": "asdfasd",
              "description": "asdfasdfasdfasdf",
              "rating": 3,
              "image":
                  "https://plus.unsplash.com/premium_photo-1715876268987-43d3d9621815?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            },
          ],
        },
      );
    } catch (e) {
      throw Exception();
    }
  }
}
