// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/customer/data/customer_datasource.dart';
import 'package:german_erp/customer/domin/customer_repository.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  CustomerDatasource datasource;
  CustomerRepositoryImpl({
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
  Future<Either<Failure, List<CustomerModel>>> getAllCustomers() async {
    try {
      return Right(await datasource.getall());
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> insert(CustomerModel customer) async {
    try {
      await datasource.insert(customer);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> update(CustomerModel customer) async {
    try {
      await datasource.update(customer);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }
}
