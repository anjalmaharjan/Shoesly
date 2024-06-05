import 'package:fpdart/fpdart.dart';
import 'package:shoesly/core/error/failures.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';

abstract interface class OrderSummaryRepository {
  Future<Either<Failure, String>> postPayment(PaymentModel paymentModel);
}
