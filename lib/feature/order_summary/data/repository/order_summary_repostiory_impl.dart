import 'package:fpdart/fpdart.dart';
import 'package:shoesly/core/error/exceptions.dart';
import 'package:shoesly/core/error/failures.dart';
import 'package:shoesly/core/network/connection_checker.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';
import '../../domain/repository/order_summary_repository.dart';
import '../datasources/order_summary_remote_data_source.dart';

class OrderSummaryRepositoryImpl implements OrderSummaryRepository {
  final OrderSummaryRemoteDataSource orderSummaryRemoteDataSource;
  final ConnectionChecker connectionChecker;
  const OrderSummaryRepositoryImpl(
      this.orderSummaryRemoteDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, String>> postPayment(PaymentModel paymentModel) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure("No Internet Connection!"));
      }
      final response =
          await orderSummaryRemoteDataSource.postPayment(paymentModel);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
