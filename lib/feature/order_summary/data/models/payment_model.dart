import 'package:shoesly/feature/discover/data/models/product_model.dart';

class PaymentModel {
  List<ProductModel>? productList;
  double? subTotal;
  double? shipping;
  double? grandTotal;

  PaymentModel(
      {this.productList, this.subTotal, this.shipping, this.grandTotal});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['productList'] != null) {
      productList = <ProductModel>[];
      json['productList'].forEach((v) {
        productList!.add(ProductModel.fromJson(v));
      });
    }
    subTotal = json['subTotal'];
    shipping = json['shipping'];
    grandTotal = json['grandTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productList != null) {
      data['productList'] = productList!.map((v) => v.toJson()).toList();
    }
    data['subTotal'] = subTotal;
    data['shipping'] = shipping;
    data['grandTotal'] = grandTotal;
    return data;
  }
}
