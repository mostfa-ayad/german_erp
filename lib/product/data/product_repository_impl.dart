// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:german_erp/core/failure.dart';
import 'package:german_erp/product/data/product_datasource.dart';
import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/domin/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductDatasource datasource;
  ProductRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    try {
      await datasource.delete(id);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      return Right(await datasource.getall());
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> insert(ProductModel product) async {
    try {
      await datasource.insert(product);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> update(ProductModel product) async {
    try {
      await datasource.update(product);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }
}
