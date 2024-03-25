// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/product/domin/product_repository.dart';

class ProductDeleteUsecase {
  ProductRepository repository;
  ProductDeleteUsecase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.delete(id);
  }
}
