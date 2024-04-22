import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';

abstract class CustomerServiceRepository {
  Future<Either<Failure, List<CustomerServiceModel>>> getAllCustomers();
  Future<Either<Failure, Unit>> insert(CustomerServiceModel service);
  Future<Either<Failure, Unit>> update(CustomerServiceModel service);
  Future<Either<Failure, Unit>> delete(int id);
}
