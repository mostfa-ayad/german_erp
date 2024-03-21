// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/global/failure.dart';
import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/domin/product_repository.dart';

class ProductInsertUsecase {
  ProductRepository repository;
  ProductInsertUsecase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(ProductModel product) async {
    return await repository.insert(product);
  }
}
