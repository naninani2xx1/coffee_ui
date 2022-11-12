import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/product_type.dart';
import 'package:coffee_kst/app/screens/home/domain/entities/voucher.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductTypeEntity>>> getProductType();
  Future<Either<Failure, List<VoucherEntity>>> getListVoucher();
  Future<Either<Failure, List<ProductEntity>>> getListProduct();
  Future<Either<Failure, List<ProductEntity>>> getBestSeller();
}
