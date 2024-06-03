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
      await firebaseFirestore.collection('shoes').add(
        {
          "name": "Jordan Max",
          "brand": "Addidas",
          "rating": 4,
          "description": "asdfasdfasd",
          "size": [39, 40, 41, 42, 43],
          "price": 235.00,
          "brandLogo": "",
          "image":
              "https://firebasestorage.googleapis.com/v0/b/shoesly-96419.appspot.com/o/shoes_images%2Fimage%2027.png?alt=media&token=b109e26a-2da9-4cc6-9ec7-9850cf4f04f2",
          "review": [
            {
              "name": "asdfasd",
              "description": "asdfasdfasdfasdf",
              "rating": 4,
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
              "rating": 4,
              "image":
                  "https://plus.unsplash.com/premium_photo-1715876268987-43d3d9621815?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            },
          ],
        },
      );
      print("object");
    } catch (e) {
      throw Exception();
    }
  }
}
