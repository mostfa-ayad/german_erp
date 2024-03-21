import 'package:dartz/dartz.dart';
import 'package:german_erp/global/failure.dart';
import 'package:german_erp/product/domin/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, Unit>> insert(ProductModel product);
  Future<Either<Failure, Unit>> update(ProductModel product);
  Future<Either<Failure, Unit>> delete(int id);
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
