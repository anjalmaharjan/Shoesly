import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/core/error/exceptions.dart';
import 'package:shoesly/feature/discover/data/models/product_model.dart';

abstract interface class DiscoverRemoteDataSource {
  Future<List<ProductModel>> getProductList();
}

class DiscoverRemoteDataSourceImpl implements DiscoverRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  DiscoverRemoteDataSourceImpl(this.firebaseFirestore);

  @override
  Future<List<ProductModel>> getProductList() async {
    try {
      final response = await firebaseFirestore.collection('shoes').get();
      List<ProductModel> requests = [];
      for (var element in response.docs) {
        Map<String, dynamic> data = element.data();
        requests.add(ProductModel.fromJson(data));
      }
      return requests;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
