import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer/domin/customer_model.dart';

abstract class CustomerRepository {
  Future<Either<Failure, Unit>> insert(CustomerModel customer);
  Future<Either<Failure, Unit>> update(CustomerModel customer);
  Future<Either<Failure, Unit>> delete(int id);
  Future<Either<Failure, List<CustomerModel>>> getAllCustomers();
}
