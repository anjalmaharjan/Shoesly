import 'package:fpdart/src/either.dart';
import 'package:shoesly/core/error/failures.dart';
import 'package:shoesly/core/usecase/usecase.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';

import '../repository/order_summary_repository.dart';

class OrderSummaryUsecase implements UseCase<String, PaymentModel> {
  final OrderSummaryRepository orderSummaryRepository;
  const OrderSummaryUsecase(this.orderSummaryRepository);

  @override
  Future<Either<Failure, String>> call(PaymentModel params) async {
    return await orderSummaryRepository.postPayment(params);
  }
}
