import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer_service/data/customer_service_datasource.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/domin/customer_service_repository.dart';

class CustomerServiceRepositoryImpl implements CustomerServiceRepository {
  final CustomerServiceDatasource datasource;

  CustomerServiceRepositoryImpl({required this.datasource});

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
  Future<Either<Failure, Unit>> insert(CustomerServiceModel service) async {
    try {
      await datasource.insert(service);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, List<CustomerServiceModel>>> getAllCustomers() async {
    try {
      return Right(await datasource.getAll());
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> update(CustomerServiceModel service) async {
    try {
      await datasource.update(service);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }
}
