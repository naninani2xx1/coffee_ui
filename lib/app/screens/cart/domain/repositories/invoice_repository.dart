import 'package:coffee_kst/app/screens/cart/domain/entities/cart.dart';
import 'package:coffee_kst/app/screens/cart/domain/usecase/add_to_cart.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class InvoiceRepository {
  Future<Either<Failure, List<CartEntity>>> getCart();
  Future<Either<Failure, int>> addToCartEmpty(ParamAddToCartEmpty params);
}
